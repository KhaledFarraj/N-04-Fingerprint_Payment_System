using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;

namespace training.Utility
{
    public class admin
    {
        public ObjectId _id { get; set; }
        public string userId { get; set; }
        public string pass { get; set; }
        public string email { get; set; }
        public string title { get; set; }
        public string level { get; set; }

        public admin(string userId, string pass, string email)
        {
            _id = new ObjectId();
            this.userId = userId;
            this.pass = pass;
            this.email = email;

        }


        public BsonDocument getBsonDoc()
        {
            var doc = new BsonDocument
            {
                { "userId", userId },
                { "pass", pass },
                { "email", email },
            };


            return doc;
        }
    }
}