using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.StorageClient;

namespace Lemon.Data
{
    public abstract class TableServiceRepository<T> : TableServiceContext, ITableServiceRepository<T> where T : TableServiceEntityBase
    {
        private CloudStorageAccount _account;
        private string _tableName;

        public TableServiceRepository(CloudStorageAccount account)
            : base(account.TableEndpoint.AbsoluteUri, account.Credentials)
        {
            _account = account;
            _tableName = typeof(T).Name;

            var client = new CloudTableClient(_account.TableEndpoint.AbsoluteUri, _account.Credentials);
            client.CreateTableIfNotExist(_tableName);
        }

        public IEnumerable<T> Retrieve()
        {
            return CreateQuery<T>(_tableName);
        }

        public void Create(T entity)
        {
            AddObject(_tableName, entity);
            SaveChanges();
        }

        public void Update(T entity)
        {
            UpdateObject(entity);
            SaveChanges();
        }

        public void Delete(T entity)
        {
            DeleteObject(entity);
            SaveChanges();
        }
    }
}
