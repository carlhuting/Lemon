using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Lemon.Data
{
 public   interface ITableServiceRepository<T> where T:TableServiceEntityBase
    {
     IEnumerable<T> Retrieve();
     void Create(T entity);
     void Update(T entity);
     void Delete(T entity);
    }
}
