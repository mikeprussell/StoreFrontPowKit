using StoreFrontPowKit.DATA.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using PagedList;
using System.Data.Entity;

namespace StoreFrontPowKit.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontPowKitEntities db = new StoreFrontPowKitEntities();

        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        // PAGING: Products
        public ActionResult SearchProducts(string searchString, int page = 1)
        {
            int pageSize = 5;

            var products = db.Products.OrderBy(p => p.ProductName).ToList();

            #region Search
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(x => x.ProductName.Contains(searchString)).ToList();
            }

            ViewBag.SearchString = searchString;
            #endregion

            return View(products.ToPagedList(page, pageSize));
        }
    }
}