using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;

namespace training.Utility
{
    public class pointOfSale
    {
        public ObjectId _id { get; set; }
        public string sellerId { get; set; }
        public string pass { get; set; }
        public string email { get; set; }
        public string title { get; set; }
        public string level { get; set; }
        public List<transactions> history { get; set; }

        public string bankAccount { get; set; }

        public pointOfSale(string sellerId, string pass, string email, string bankAccount)
        {
            _id = new ObjectId();
            this.sellerId = sellerId;
            this.pass = pass;
            this.email = email;
            this.bankAccount = bankAccount;
            this.history = null;
        }

        public BsonDocument getBsonDoc()
        {
            var hist = new BsonDocument();

            var doc = new BsonDocument
            {
                { "sellerId", sellerId },
                { "pass", pass },
                { "email", email },
                { "bankAccount", bankAccount },
                { "history", hist },
            };

            return doc;
        }

    }
}