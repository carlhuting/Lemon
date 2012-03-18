using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.WindowsAzure.StorageClient;
namespace Lemon.Data
{
  public abstract  class TableServiceEntityBase:TableServiceEntity
    {
        public DateTime CreatedOn { get; set; }
        protected TableServiceEntityBase()
            : this(string.Empty, string.Empty)
        { }
        protected TableServiceEntityBase(string partitionKey)
            : this(partitionKey, Guid.NewGuid().ToString())
        { }
        protected TableServiceEntityBase(string partitionKey, string rowKey)
            : base(partitionKey, rowKey)
        { }
    }
}
