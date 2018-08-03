using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using training.Utility;

namespace training.Pages
{
    public partial class Seller : System.Web.UI.Page
    {
        crud operations = new crud();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonUpload_Click(object sender, EventArgs e)
        {
            //if (FileUpload1.HasFile && fileupload2.HasFile)
            //{

            //    Bitmap firstImage = new Bitmap(FileUpload1.PostedFile.InputStream);
            //    Bitmap secondImage = new Bitmap(fileupload2.PostedFile.InputStream);
            //    byte[] firstData;

            //    using (MemoryStream stream = new MemoryStream())
            //    {
            //        firstImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
            //        firstData = stream.ToArray();
            //    }

            //    byte[] secondData;

            //    using (MemoryStream stream = new MemoryStream())
            //    {
            //        secondImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
            //        secondData = stream.ToArray();
            //    }

                //bool test = compareBinaryImages(firstData, secondData);




                //string test = compareImages(firstImage, secondImage);
                //double percentage = compareImagesPercents(firstImage, secondImage);
                //label1.Text = test.ToString();
                //label2.Text = "They match by: " + percentage.ToString() + "%";

            //}

        }

        public static string compareImages(Bitmap image1, Bitmap image2)
        {
            MemoryStream ms = new MemoryStream();
            image1.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            String bitmap1 = Convert.ToBase64String(ms.ToArray());
            ms.Position = 0;

            image2.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            String bitmap2 = Convert.ToBase64String(ms.ToArray());

            if (bitmap1.Equals(bitmap2))
            {
                return "The fingerprints Match!";
            }
            else
            {
                return "The fingerprints dont match";
            }
        }


        public static double compareImagesPercents(Bitmap image1, Bitmap image2)
        {
            // Sppose the size of two images are equal
            int min_width = image1.Width < image2.Width ? image1.Width : image2.Width;
            int min_height = image1.Height < image2.Height ? image1.Height : image2.Height;
            int max_width = image1.Width > image2.Width ? image1.Width : image2.Width;
            int max_height = image1.Height > image2.Height ? image1.Height : image2.Height;

            double size = min_width * min_height;
            double Identical_pixels = 0;
            double DiferentPixels = 0;
            for (int i = 0; i < min_width; i++)
            {
                for (int j = 0; j < min_height; j++)
                {

                    Color secondColor = image2.GetPixel(i, j);
                    Color firstColor = image1.GetPixel(i, j);

                    if (firstColor != secondColor)
                    {
                        DiferentPixels++;
                        //container.SetPixel(i, j, Color.Red);
                    }
                    else
                    {
                        //container.SetPixel(i, j, firstColor);
                    }



                    string image1_pixel = image1.GetPixel(i, j).ToString();
                    string image2_pixel = image2.GetPixel(i, j).ToString();
                    if (image1_pixel == image2_pixel)
                    {
                        Identical_pixels++;
                    }
                }
            }
            return (Identical_pixels / size) * 100;
        }

        protected void transfer_Click(object sender, EventArgs e)
        {
            string sellerId = Session["sellerId"].ToString();
            Bitmap uploadedFPImage = new Bitmap(FPFU.PostedFile.InputStream);

            byte[] data;
            using (MemoryStream stream = new MemoryStream())
            {
                uploadedFPImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                data = stream.ToArray();
            }


            BsonDocument doc = operations.findByFingerprint(data);
            if (doc != null)
            {
                double transferAmount = Convert.ToDouble(Cost_txtbox.Text);
                operations.newTransaction(sellerId, doc["pilgrimId"].AsString, transferAmount);


                testCompare.Text = "Transaction completed successfully";
            }
            else
            {
                testCompare.Text = "There is no pilgrim with this fingerprint!";
            }


        }


        public bool compareBinaryImages(BsonBinaryData uploadedFP, BsonBinaryData pilgrimFP)
        {
            if (uploadedFP.Equals(pilgrimFP))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


    }
}