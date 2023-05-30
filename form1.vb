Imports MySql.Data.MySqlClient

Public Class Form1
    Private conn As MySqlConnection = koneksi.GetConnection()

    Private Sub Form1_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        LoadData()
    End Sub

    Private Sub LoadData()
        Dim query As String = "SELECT * FROM tb_mhs"
        Dim adapter As New MySqlDataAdapter(query, conn)
        Dim table As New DataTable()
        adapter.Fill(table)
        DataGridView1.DataSource = table
    End Sub

    Private Sub ClearFields()
        txtid.Text = ""
        txtnama.Text = ""
        txtjurusan.Text = ""
        txttahun.Text = ""
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim query As String = "INSERT INTO tb_mhs (nama, jurusan, tahun_masuk) VALUES (@nama, @jurusan, @tahun_masuk)"
        Dim cmd As New MySqlCommand(query, conn)
        cmd.Parameters.AddWithValue("@nama", txtnama.Text)
        cmd.Parameters.AddWithValue("@jurusan", txtjurusan.Text)
        cmd.Parameters.AddWithValue("@tahun_masuk", txttahun.Text)

        Try
            conn.Open()
            cmd.ExecuteNonQuery()
            LoadData()
            ClearFields()
        Catch ex As Exception
            MessageBox.Show("Error: " + ex.Message)
        Finally
            conn.Close()
        End Try
    End Sub

    Private Sub DataGridView1_CellClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If e.RowIndex >= 0 Then
            Dim row As DataGridViewRow = DataGridView1.Rows(e.RowIndex)
            txtid.Text = row.Cells("id").Value.ToString()
            txtnama.Text = row.Cells("nama").Value.ToString()
            txtjurusan.Text = row.Cells("jurusan").Value.ToString()
            txttahun.Text = row.Cells("tahun_masuk").Value.ToString()
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        If String.IsNullOrEmpty(txtid.Text) Then
            MessageBox.Show("Pilih data yang akan diubah.")
            Return
        End If

        Dim query As String = "UPDATE tb_mhs SET nama=@nama, jurusan=@jurusan, tahun_masuk=@tahun_masuk WHERE id=@id"
        Dim cmd As New MySqlCommand(query, conn)
        cmd.Parameters.AddWithValue("@nama", txtnama.Text)
        cmd.Parameters.AddWithValue("@jurusan", txtjurusan.Text)
        cmd.Parameters.AddWithValue("@tahun_masuk", txttahun.Text)
        cmd.Parameters.AddWithValue("@id", txtid.Text)

        Try
            conn.Open()
            cmd.ExecuteNonQuery()
            LoadData()
            ClearFields()
        Catch ex As Exception
            MessageBox.Show("Error: " + ex.Message)
        Finally
            conn.Close()
        End Try
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        If String.IsNullOrEmpty(txtid.Text) Then
            MessageBox.Show("Pilih data yang akan dihapus.")
            Return
        End If

        If MessageBox.Show("Anda yakin ingin menghapus data ini?.", "konfirmasi", MessageBoxButtons.YesNo) = DialogResult.Yes Then
            Dim query As String = "DELETE FROM tb_mhs WHERE id=@id"
            Dim cmd As New MySqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@id", txtid.Text)

            Try
                conn.Open()
                cmd.ExecuteNonQuery()
                LoadData()
                ClearFields()
            Catch ex As Exception
                MessageBox.Show("Error: " + ex.Message)
            Finally
                conn.Close()
            End Try
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        ClearFields()
        LoadData()
    End Sub

    Private Sub txtid_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtid.TextChanged

    End Sub
End Class
