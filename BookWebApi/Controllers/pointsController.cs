using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using BookWebApi.Entites;

namespace BookWebApi.Controllers
{
    public class pointsController : ApiController
    {
        private BookEntities db = new BookEntities();

        // GET: api/points
        public IQueryable<point> Getpoint()
        {
            return db.point;
        }

        [Route("api/getPoint")]
        public IHttpActionResult GetPoint(int pointId) 
        {
            var point = db.point.ToList().Where(p => p.id == pointId).ToList();
            return Ok(point);
        }

        // GET: api/points/5
        [ResponseType(typeof(point))]
        public IHttpActionResult Getpoint(int id)
        {
            point point = db.point.Find(id);
            if (point == null)
            {
                return NotFound();
            }

            return Ok(point);
        }

        // PUT: api/points/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putpoint(int id, point point)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != point.id)
            {
                return BadRequest();
            }

            db.Entry(point).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!pointExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/points
        [ResponseType(typeof(point))]
        public IHttpActionResult Postpoint(point point)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.point.Add(point);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = point.id }, point);
        }

        // DELETE: api/points/5
        [ResponseType(typeof(point))]
        public IHttpActionResult Deletepoint(int id)
        {
            point point = db.point.Find(id);
            if (point == null)
            {
                return NotFound();
            }

            db.point.Remove(point);
            db.SaveChanges();

            return Ok(point);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool pointExists(int id)
        {
            return db.point.Count(e => e.id == id) > 0;
        }
    }
}