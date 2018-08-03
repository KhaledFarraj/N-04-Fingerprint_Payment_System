using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace training.Utility
{
    public class crud
    {


        public BsonDocument findPilgrim(string pilgrimId)
        {

            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("hajjhackathon");
            var pilgrimColl = database.GetCollection<BsonDocument>("Pilgrim");
            var adminColl = database.GetCollection<BsonDocument>("Admin");
            var POSColl = database.GetCollection<BsonDocument>("PointOfSale");
            var transactionsColl = database.GetCollection<BsonDocument>("Transaction");


            var filter = Builders<BsonDocument>.Filter.Eq("pilgrimId", pilgrimId);
            var document = pilgrimColl.Find(filter).FirstOrDefault();

            return document;
        }

        public void createNewPilgrimAccount(BsonDocument doc)
        {

            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("hajjhackathon");
            var pilgrimColl = database.GetCollection<BsonDocument>("Pilgrim");
            var adminColl = database.GetCollection<BsonDocument>("Admin");
            var POSColl = database.GetCollection<BsonDocument>("PointOfSale");
            var transactionsColl = database.GetCollection<BsonDocument>("Transaction");


            pilgrimColl.InsertOne(doc);
        }


        public void editPilgrimInfo(string pilgrimId, BsonDocument doc)
        {
            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("hajjhackathon");
            var pilgrimColl = database.GetCollection<BsonDocument>("Pilgrim");

            var filter = Builders<BsonDocument>.Filter.Eq("pilgrimId", pilgrimId);
            var document = pilgrimColl.Find(filter).FirstOrDefault();



            if (document != null)
            {
                pilgrimColl.FindOneAndUpdate(filter, doc);
            }
            else
            {
                // wrong id
            }


        }

        public void transfer(string sellerId, string pilgrimId, double amount)
        {

        }

        public BsonDocument findByFingerprint(BsonBinaryData fpData)
        {
            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("hajjhackathon");
            var pilgrimColl = database.GetCollection<BsonDocument>("Pilgrim");

            var filter = Builders<BsonDocument>.Filter.Eq("fingerprintData", fpData);
            var document = pilgrimColl.Find(filter).FirstOrDefault();

            return document;
        }

        public void newTransaction(string sellerId, string pilgrimId, double amount)
        {

            var client = new MongoClient("mongodb://localhost:27017");
            var database = client.GetDatabase("hajjhackathon");
            var pilgrimColl = database.GetCollection<BsonDocument>("Pilgrim");
            var transColl = database.GetCollection<BsonDocument>("Transactions");


            DateTime date = DateTime.Now;
            transactions tr;

            // withdraw the amount from the pilgrim account
            BsonDocument doc = findPilgrim(pilgrimId);

            double currentCredit = doc["HCredit"].AsDouble;
            if (currentCredit < amount)
            {
                // pilgrim doesn't have enough credit
                tr = new transactions(sellerId, pilgrimId, date, amount, "Denied");

            }
            else
            {
                double newCredit = currentCredit - amount;

                var filter = Builders<BsonDocument>.Filter.Eq("pilgrimId", pilgrimId);
                var update = Builders<BsonDocument>.Update.Set("HCredit", newCredit);

                pilgrimColl.FindOneAndUpdate(filter, update);
                tr = new transactions(sellerId, pilgrimId, date, amount, "Complete");

            }

            transColl.InsertOne(tr.getBsonDoc());


        }

        public List<transactions> getTransactions(string pilgrimID)
        {
            BsonDocument pilgrim = findPilgrim(pilgrimID);

            if (pilgrim != null)
            {
                var client = new MongoClient("mongodb://localhost:27017");
                var database = client.GetDatabase("hajjhackathon");
                var transColl = database.GetCollection<transactions>("Transactions");

                var filter = Builders<transactions>.Filter.Eq("costumerId", pilgrimID);

                List<transactions> tr = transColl.Find(filter).ToList<transactions>();
                return tr;

            }
            else
            {
                return null;
            }

        }



    }
}