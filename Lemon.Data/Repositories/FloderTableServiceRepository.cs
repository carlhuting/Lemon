using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Lemon.Data.Entities;
using Microsoft.WindowsAzure;

namespace Lemon.Data.Repositories
{
   public class FloderTableServiceRepository:TableServiceRepository<Floder>,ITableServiceRepository<Floder>
    {
        public FloderTableServiceRepository(CloudStorageAccount account)
            : base(account)
        { }
    }
}
