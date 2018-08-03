using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Drawing;
using System.IO;

namespace training.Utility
{
    public class Pilgrim
    {
        public ObjectId _id { get; set; }

        public string fullName { get; set; }

        public string pilgrimId { get; set; }

        public string userId { get; set; }

        public string nationality { get; set; }

        public string residency { get; set; }

        public string fingerPrintHash { get; set; }

        public BsonBinaryData fingerprintData { get; set; }

        public double HCredit { get; set; }

        public string phone { get; set; }


        public Pilgrim(string fullName, string pilgrimId, string userId, string nationality, string residency, BsonBinaryData fpData, double HCredit, string phone)
        {
            _id = new ObjectId();
            this.fullName = fullName;
            this.pilgrimId = pilgrimId;
            this.userId = userId;
            this.nationality = nationality;
            this.residency = residency;
            this.fingerprintData = fpData;
            this.HCredit = HCredit;
            this.phone = phone;
        }


        public BsonDocument getBsonDoc ()
        {
            var doc = new BsonDocument
            {
                { "fullName", fullName },
                { "pilgrimId", pilgrimId },
                { "userId", userId },
                { "nationality", nationality },
                { "residency", residency },
                { "fingerprintData", fingerprintData },
                { "HCredit", HCredit },
                { "phone", phone }
            };


            return doc;
        }

        public bool compareFingerprints(BsonBinaryData uploadedFingerprint)
        {

            return true;
            //byte[] data;

            //using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            //{
            //    image.Save(stream, System.Drawing.Imaging.ImageFormat.Bmp);
            //    data = stream.ToArray();
            //}


            //MemoryStream ms = new MemoryStream();
            //uploadedFingerprint.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            //String bitmap1 = Convert.ToBase64String(ms.ToArray());
            //ms.Position = 0;

            //image2.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            //String bitmap2 = Convert.ToBase64String(ms.ToArray());

            //if (bitmap1.Equals(bitmap2))
            //{
            //    return "The fingerprints Match!";
            //}
            //else
            //{
            //    return "The fingerprints dont match";
            //}
        }



        



    }
}