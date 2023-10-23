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

namespace DE03
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Hienthi();
        }

        XmlDocument doc = new XmlDocument();
        string tentep = @"D:\STUDY\HOCKY7\THHTPM\ONKIEMTRA2\DE03\sach.xml";
        int d;

        private void Hienthi()
        {
            dataSach.Rows.Clear();
            doc.Load(tentep);

            XmlNodeList ds = doc.SelectNodes("/thuvien/sach");

            int sd = 0;
            dataSach.ColumnCount = 5;
            dataSach.Rows.Add();

            foreach (XmlNode s in ds)
            {
                XmlNode ma_sach = s.SelectSingleNode("@masach");
                XmlNode ten_sach = s.SelectSingleNode("tensach");
                XmlNode so_trang = s.SelectSingleNode("sotrang");
                XmlNode ho_ten = s.SelectSingleNode("tacgia/@hoten");
                XmlNode dia_chi = s.SelectSingleNode("tacgia/diachi");

                dataSach.Rows[sd].Cells[0].Value = ma_sach.InnerText;
                dataSach.Rows[sd].Cells[1].Value = ten_sach.InnerText;
                dataSach.Rows[sd].Cells[2].Value = so_trang.InnerText;
                dataSach.Rows[sd].Cells[3].Value = ho_ten.InnerText;
                dataSach.Rows[sd].Cells[4].Value = dia_chi.InnerText;

                dataSach.Rows.Add();
                sd++;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);

            XmlElement goc = doc.DocumentElement;

            XmlNode chkSach = goc.SelectSingleNode("/thuvien/sach[@masach = '" + txtMaSach.Text + "']");

            if(chkSach != null)
            {
                MessageBox.Show("Trùng mã sách", "Thông báo", MessageBoxButtons.OK);
                return;
            }

            XmlNode s = doc.CreateElement("sach");
            XmlAttribute ma_sach = doc.CreateAttribute("masach");
            XmlNode ten_sach = doc.CreateElement("tensach");
            XmlNode so_trang = doc.CreateElement("sotrang");
            XmlNode tac_gia = doc.CreateElement("tacgia");
            XmlAttribute ho_ten = doc.CreateAttribute("hoten");
            XmlNode dia_chi = doc.CreateElement("diachi");

            ma_sach.InnerText = txtMaSach.Text;
            ten_sach.InnerText = txtTenSach.Text;
            so_trang.InnerText = txtSoTrang.Text;
            ho_ten.InnerText = txtHoTen.Text;
            dia_chi.InnerText = txtDiaChi.Text;

            s.Attributes.Append(ma_sach);
            s.AppendChild(ten_sach);
            s.AppendChild(so_trang);
            tac_gia.Attributes.Append(ho_ten);
            tac_gia.AppendChild(dia_chi);
            s.AppendChild(tac_gia);
            goc.AppendChild(s);

            doc.Save(tentep);
            Hienthi();
        }

        private void dataSach_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            d = e.RowIndex;
            txtMaSach.Text = dataSach.Rows[d].Cells[0].Value.ToString();
            txtTenSach.Text = dataSach.Rows[d].Cells[1].Value.ToString();
            txtSoTrang.Text = dataSach.Rows[d].Cells[2].Value.ToString();
            txtHoTen.Text = dataSach.Rows[d].Cells[3].Value.ToString();
            txtDiaChi.Text = dataSach.Rows[d].Cells[4].Value.ToString();

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);

            XmlElement goc = doc.DocumentElement;

            XmlNode chkSach = goc.SelectSingleNode("/thuvien/sach[@masach = '" + txtMaSach.Text + "']");

            if(chkSach == null)
            {
                MessageBox.Show("Không tồn tại mã sách", "Thông báo", MessageBoxButtons.OK);
                return;
            }
            DialogResult res = MessageBox.Show("Bạn có chắc chắn xóa không?", "Xác nhận xóa", MessageBoxButtons.YesNo);
            if(res == DialogResult.Yes)
            {
                goc.RemoveChild(chkSach);
            }
            doc.Save(tentep);
            Hienthi();
        }

        private void btnTim_Click(object sender, EventArgs e)
        {
            dataSach.Rows.Clear();
            doc.Load(tentep);

            XmlElement goc = doc.DocumentElement;

            int sotrang1 = int.Parse(txtTrang1.Text);
            int sotrang2 = int.Parse(txtTrang2.Text);

            XmlNodeList timSoTrang = goc.SelectNodes("/thuvien/sach[sotrang >= " + sotrang1 + " and sotrang <= " + sotrang2 + "]");

            int sd = 0;
            dataSach.ColumnCount = 5;
            dataSach.Rows.Add();

            foreach (XmlNode s in timSoTrang)
            {
                XmlNode ma_sach = s.SelectSingleNode("@masach");
                XmlNode ten_sach = s.SelectSingleNode("tensach");
                XmlNode so_trang = s.SelectSingleNode("sotrang");
                XmlNode ho_ten = s.SelectSingleNode("tacgia/@hoten");
                XmlNode dia_chi = s.SelectSingleNode("tacgia/diachi");

                dataSach.Rows[sd].Cells[0].Value = ma_sach.InnerText;
                dataSach.Rows[sd].Cells[1].Value = ten_sach.InnerText;
                dataSach.Rows[sd].Cells[2].Value = so_trang.InnerText;
                dataSach.Rows[sd].Cells[3].Value = ho_ten.InnerText;
                dataSach.Rows[sd].Cells[4].Value = dia_chi.InnerText;

                dataSach.Rows.Add();
                sd++;
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            doc.Load(tentep);

            XmlElement goc = doc.DocumentElement;

            XmlNode chkSach = goc.SelectSingleNode("/thuvien/sach[@masach = '" + txtMaSach.Text + "']");

            if (chkSach == null)
            {
                MessageBox.Show("Không tìm thấy mã sách", "Thông báo", MessageBoxButtons.OK);
                return;
            }

            XmlNode s = doc.CreateElement("sach");

            XmlAttribute ma_sach = doc.CreateAttribute("masach");
            XmlNode ten_sach = doc.CreateElement("tensach");
            XmlNode so_trang = doc.CreateElement("sotrang");
            XmlNode tac_gia = doc.CreateElement("tacgia");
            XmlAttribute ho_ten = doc.CreateAttribute("hoten");
            XmlNode dia_chi = doc.CreateElement("diachi");

            ma_sach.InnerText = txtMaSach.Text;
            ten_sach.InnerText = txtTenSach.Text;
            so_trang.InnerText = txtSoTrang.Text;
            ho_ten.InnerText = txtHoTen.Text;
            dia_chi.InnerText = txtDiaChi.Text;

            s.Attributes.Append(ma_sach);
            s.AppendChild(ten_sach);
            s.AppendChild(so_trang);
            tac_gia.Attributes.Append(ho_ten);
            tac_gia.AppendChild(dia_chi);
            s.AppendChild(tac_gia);

            goc.ReplaceChild(s, chkSach);

            doc.Save(tentep);
            Hienthi();
        }
    }
}
