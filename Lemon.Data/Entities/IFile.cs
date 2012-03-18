using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
/*
 *IFile主要保存文件信息
 *有文件名，文件创建时间，文件大小，文件类型
 *
 * 时间：2012.3.13
 * 作者：carl
 */
namespace Lemon.Data
{
 public interface IFile
    {
       string Name { get; set; }
    DateTime CreateTime { get; set; }
      uint Size { get; set; }
    }
}
