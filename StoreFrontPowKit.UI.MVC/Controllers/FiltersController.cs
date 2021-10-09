using StoreFrontPowKit.DATA.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using PagedList;
using System.Data.Entity;
using System.Net;
using System.Data;
using System.Drawing;
using StoreFrontPowKit.UI.MVC.Utilities;

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
                products = products.Where(x => x.ProductName.ToLower().Contains(searchString.ToLower())).ToList();
            }

            ViewBag.SearchString = searchString;
            #endregion

            return View(products.ToPagedList(page, pageSize));
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin, Operations Employee")]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.ProductStatusID = new SelectList(db.ProductStatuses, "ProductStatusID", "StatusName");
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductImage,ProductID,ProductName,Description,SupplierID,CategoryID,UnitPrice,ProductStatusID")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload w/ Utility
                string file = "NoImage.png";

                if (productImage != null)
                {
                    file = productImage.FileName;

                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = { ".jpg", "jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext))
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        //params for the Image Utility
                        //what we need: filepath, image file, maximum image size (full size), maximum thumb size (thumbnail)

                        string savePath = Server.MapPath("~/Content/images/products/");

                        //image file
                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        //max image size
                        int maxImageSize = 500;//value in pixels

                        //max thumb size
                        int maxThumbSize = 100;

                        //Call the ImageUtility to do work
                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        #endregion

                    }

                    else
                    {
                        file = "NoImage.png";
                    }

                    product.ProductImage = file;
                }

                #endregion

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatuses, "ProductStatusID", "StatusName", product.ProductStatusID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin, Operations Employee")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatuses, "ProductStatusID", "StatusName", product.ProductStatusID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductImage,ProductID,ProductName,Description,SupplierID,CategoryID,UnitPrice,ProductStatusID")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload w/Utility
                //check to see if a new file has been uploaded. If not, the HiddenFor() from the View will maintain
                //the original value

                string file = "";

                if (productImage != null)
                {
                    //retrieve the name of the file so we can chekc it's extension
                    file = productImage.FileName;

                    //retrieve the extension
                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExts.Contains(ext))
                    {
                        //create a new file name (using a GUID so it will be unique)
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        //params for the ResizeImage() method
                        string savePath = Server.MapPath("~/Content/images/products/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;

                        //Call the Image service method to resize our Image
                        //ResizeImage() will save 2 resized copies of our original image -- 1 full size, and 1 thumbnail
                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion

                        #region Delete the old image
                        if (product.ProductImage != null && product.ProductImage != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/images/products/");
                            ImageUtility.Delete(path, product.ProductImage);

                        }
                        #endregion

                        product.ProductImage = file;

                    }

                }

                #endregion

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatuses, "ProductStatusID", "StatusName", product.ProductStatusID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin, Operations Employee")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);

            string path = Server.MapPath("~/Content/images/products/");
            ImageUtility.Delete(path, product.ProductImage);

            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}