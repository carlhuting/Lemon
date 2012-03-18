using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.WindowsAzure;
using Lemon.Data.Entities;
using Lemon.Data.Repositories;

namespace MvcWebRole.Controllers
{
    public class FloderController : Controller
    {
        //
        // GET: /Floder/
        [HttpGet]
        public ActionResult Index()
        {
            var ctx = new FloderTableServiceRepository(CloudStorageAccount.FromConfigurationSetting("DataConnectionString"));
            var floders = ctx.Retrieve()
                .ToList()
                .OrderByDescending(al => al.CreatedOn);
            return View(floders);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View(new Floder("200813137173"));
        }

        [HttpPost]
        public ActionResult Create(Floder floder)
        {
            // validation
            if (string.IsNullOrWhiteSpace(floder.Name))
                ModelState.AddModelError("Name", "Please input the name of the album.");
            var ctx = new FloderTableServiceRepository(CloudStorageAccount.FromConfigurationSetting("DataConnectionString"));
            if (ModelState.IsValid)
                if (ctx.Retrieve().Where(al => al.Name == floder.Name).FirstOrDefault() != null)
                    ModelState.AddModelError("Name", "floder name is existed.");
            // create new floder
            if (ModelState.IsValid)
            {
               floder.CreatedOn = DateTime.Now;
                floder.ViewedCount = 0;
                ctx.Create(floder);
                return RedirectToAction("Index");
            }
            else
            {
                return Create();
            }
        }

    }
}
