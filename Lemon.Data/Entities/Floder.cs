using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.WindowsAzure.StorageClient;

namespace Lemon.Data.Entities
{
    public class Floder : TableServiceEntityBase
    {
        public string Name { get; set; }

        public long ViewedCount { get; set; }

        public Floder(string id)
            : base(id, Guid.NewGuid().ToString())
        {
        }

        public Floder()
            : base()
        {
        }
    }
}
