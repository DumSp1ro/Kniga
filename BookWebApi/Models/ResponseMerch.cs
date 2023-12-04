using BookWebApi.Entites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookWebApi.Models
{
    public class ResponseMerch
    {
        public ResponseMerch(merch merch) 
        {
            Id = merch.id;
            Name = merch.name;
            Dexcription = merch.dexcription;
            Manufacturer = merch.manufacturer;
            Photo = merch.photo;
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Dexcription { get; set; }
        public string Manufacturer { get; set; }
        public string Photo { get; set; }
    }
}