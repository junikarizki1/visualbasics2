Imports MySql.Data.MySqlClient

Public Class koneksi
    Private Shared conn As MySqlConnection
    Private Shared connectionString As String = "Server=localhost;Database=data_mahasiswa;Uid=root;"

    Public Shared Function GetConnection() As MySqlConnection
        If conn Is Nothing Then
            conn = New MySqlConnection(connectionString)
        End If

        Return conn
    End Function
End Class
