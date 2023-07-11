Imports MySql.Data.MySqlClient
Imports System.Data

Public Class koneksi
    Private conn As MySqlConnection
    Public Function koneksi() As MySqlConnection
        Dim connstring As String
        connstring = ";Server=localhost" & ";user=root" & ";password=''" & ";database=db_lppm(junikarizki)"
        Try
            conn = New MySqlConnection(connstring)
            conn.Open()
        Catch ex As Exception
            MessageBox.Show("koneksi eror" + ex.Message)
        End Try
        Return conn
    End Function

    Private Sub koneksi_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
