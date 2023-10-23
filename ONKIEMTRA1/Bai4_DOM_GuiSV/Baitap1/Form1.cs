using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace Baitap1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //BUOC 1: Tạo đối tượng sử dụng tài liệu xml + Tạo đường dẫn đến file xml
        XmlDocument doc = new XmlDocument();
        string tentep = @"D:\STUDY\HOCKY7\THHTPM\ONKIEMTRA1\Bai4_DOM_GuiSV\Baitap1\dsnhanvien.xml";
        int d; //Số dòng được chọn trên data grid
        private void Form1_Load(object sender, EventArgs e)
        {
            Hienthi();
        }
        private void Hienthi()
        {
            //Clear data + load tệp xml
            datanhanvien.Rows.Clear();
            doc.Load(tentep);

            XmlNodeList DS = doc.SelectNodes("/ds/nhanvien");
            int sd = 0; // số dòng
            datanhanvien.ColumnCount = 3;
            datanhanvien.Rows.Add();
            //duyệt từng nút nhân viên
            foreach(XmlNode nv in DS)
            {
                XmlNode ma_nv = nv.SelectSingleNode("@manv");
                datanhanvien.Rows[sd].Cells[0].Value = ma_nv.InnerText.ToString();

                XmlNode ho_ten = nv.SelectSingleNode("hoten");
                datanhanvien.Rows[sd].Cells[1].Value = ho_ten.InnerText.ToString();

                XmlNode dia_chi = nv.SelectSingleNode("diachi");
                datanhanvien.Rows[sd].Cells[2].Value = dia_chi.InnerText.ToString();

                datanhanvien.Rows.Add();
                sd++;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);
            XmlElement goc = doc.DocumentElement;

            XmlNode nhan_vien = doc.CreateElement("nhanvien");
            XmlAttribute ma_nv = doc.CreateAttribute("manv");
            XmlNode ho_ten = doc.CreateElement("hoten");
            XmlNode dia_chi = doc.CreateElement("diachi");

            ma_nv.InnerText = txtManv.Text;
            nhan_vien.Attributes.Append(ma_nv);
            ho_ten.InnerText = txtHoten.Text;
            nhan_vien.AppendChild(ho_ten);
            dia_chi.InnerText = txtDiachi.Text;
            nhan_vien.AppendChild(dia_chi);

            goc.AppendChild(nhan_vien);

            doc.Save(tentep);
            Hienthi();
        }
    }
}
