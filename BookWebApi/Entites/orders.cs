//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BookWebApi.Entites
{
    using System;
    using System.Collections.Generic;
    
    public partial class orders
    {
        public int id { get; set; }
        public int id_users { get; set; }
        public int id_status { get; set; }
        public int id_point { get; set; }
        public System.DateTime order_date { get; set; }
        public int code { get; set; }
        public int cost { get; set; }
        public Nullable<int> discount { get; set; }
    
        public virtual point point { get; set; }
        public virtual status status { get; set; }
        public virtual users users { get; set; }
        public virtual sostav sostav { get; set; }
    }
}
