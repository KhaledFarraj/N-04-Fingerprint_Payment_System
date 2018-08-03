using MongoDB.Bson;
using MongoDB.Driver;
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
    public partial class Admin : System.Web.UI.Page
    {

        crud operations = new crud();
        //bool overridePageLoad = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SearchContainer.Visible = false;
                AddContainer.Visible = false;
                EditContainer.Visible = false;
                searchResult.Visible = false;
            }
        }

        public void btn_search_Click(object sender, EventArgs e)
        {
            SearchContainer.Visible = true;
            AddContainer.Visible = false;
            EditContainer.Visible = false;
        }

        public void btn_add_Click(object sender, EventArgs e)
        {
            SearchContainer.Visible = false;
            AddContainer.Visible = true;
            EditContainer.Visible = false;
        }

        public void btn_edit_Click(object sender, EventArgs e)
        {
            SearchContainer.Visible = false;
            AddContainer.Visible = false;
            EditContainer.Visible = true;
        }

        protected void search_Click(object sender, EventArgs e)
        {
            string pId = txt_search_pilgrim.Text;

            //var client = new MongoClient("mongodb://localhost:27017");
            //var database = client.GetDatabase("hajjhackathon");
            //var pilgrimColl = database.GetCollection<BsonDocument>("Pilgrim");
            //var filter = Builders<BsonDocument>.Filter.Eq("pilgrimId", pId);
            //var document = pilgrimColl.Find(filter).First();

            //overridePageLoad = true;

            BsonDocument document = operations.findPilgrim(pId);

            if (document != null)
            {
                fullName.Text = document["fullName"].AsString;
                pilgrimId.Text = document["pilgrimId"].AsString;
                userId.Text = document["userId"].AsString;
                nationality.Text = document["nationality"].AsString;
                residency.Text = document["residency"].AsString;
                credit.Text = document["HCredit"].AsDouble.ToString();
                phone.Text = document["phone"].AsString;

                Session["adminPilgrimID"] = pilgrimId.Text;

                // get transactions

                List<transactions> tr = operations.getTransactions(pId);

                if (tr != null)
                {
                    gvTransactions.DataSource = tr;
                    gvTransactions.DataBind();
                }
                else
                {
                    Label lb = new Label();
                    lb.Text = "There are no transactions for this pilgrim";
                    noTransactions.Controls.Add(lb);
                }

                //if (tr != null)
                //{
                //    foreach (var item in tr)
                //    {

                //    }
                //}
                //else
                //{
                //    // no transactions
                //}



                // this should be in another method, but for now keep it here
                BsonDocument oldPilgrimInfo = operations.findPilgrim(pId);

                txt_edit_fullName.Text = oldPilgrimInfo["fullName"].AsString;
                txt_edit_pilgrimId.Text = oldPilgrimInfo["pilgrimId"].AsString;
                txt_edit_userId.Text = oldPilgrimInfo["userId"].AsString;
                txt_edit_nationality.Text = oldPilgrimInfo["nationality"].AsString;
                txt_edit_residency.Text = oldPilgrimInfo["residency"].AsString;
                txt_edit_credit.Text = oldPilgrimInfo["HCredit"].AsDouble.ToString();
                txt_edit_phone.Text = oldPilgrimInfo["phone"].AsString;

            }
            else
            {
                // no pilgrim with this id
            }

        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            string fullName = txt_new_fullName.Text;
            string pilgrimId = txt_new_pilgrimId.Text;
            string userId = txt_new_userId.Text;
            string nationality = txt_new_nationality.Text;
            string residency = txt_new_residency.Text;
            double credit = Convert.ToDouble(txt_new_credit.Text);
            string phone = txt_new_phone.Text;

            Bitmap fpImage = new Bitmap(fingerPrint.PostedFile.InputStream);
            byte[] data;

            using (MemoryStream stream = new MemoryStream())
            {
                fpImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                data = stream.ToArray();
            }




            // test

            //BsonDocument pilgrim = operations.findPilgrim(pilgrimId);
            if (operations.findPilgrim(pilgrimId) == null)
            {
                Pilgrim newP = new Pilgrim(fullName, pilgrimId, userId, nationality, residency, data, credit, phone);

                operations.createNewPilgrimAccount(newP.getBsonDoc());
            }
            else
            {
                // the id already exists
            }

        }

        protected void editPilgrimInfo_Click(object sender, EventArgs e)
        {

            string pilgrimId = Session["adminPilgrimID"].ToString();
            BsonDocument document = operations.findPilgrim(pilgrimId);

            string fullName = txt_edit_fullName.Text;
            string userId = txt_edit_userId.Text;
            string nationality = txt_edit_nationality.Text;
            string residency = txt_edit_residency.Text;
            double credit = Convert.ToDouble(txt_edit_credit.Text);
            string phone = txt_edit_phone.Text;
            BsonBinaryData fpdata = document["fingerprintData"].AsBsonBinaryData;

            Pilgrim newP = new Pilgrim(fullName, txt_edit_pilgrimId.Text, userId, nationality, residency, fpdata, credit, phone);

            operations.editPilgrimInfo(pilgrimId, newP.getBsonDoc());


        }
        protected void LOGOUT(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");

        }
    }
}