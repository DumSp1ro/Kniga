using BookWebApi.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookWebApi.Models
{
    public class ResponsePoint
    {
        public ResponsePoint(point point)
        {
            Id = point.id;
            Name = point.name;
            Photo = point.photo;
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Photo { get; set; }
    }
}