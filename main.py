from flask import Flask, render_template, redirect, request, url_for
from mysql import connector

app = Flask(__name__)

db = cursor = None
def openDb():
    global db, cursor
    db = connector.connect(
            host = "localhost",
            user = "root",
            passwd = "",
            database = "db_rsa" 
    )
    if db.is_connected():
        print("Berhasil terhubung dengan database")

    cursor = db.cursor()	

def closeDb():
    global db, cursor
    cursor.close()
    db.close()



@app.route('/')
def index():
    openDb()

    cursor.execute("SELECT COUNT(id_dokter) FROM tbl_dokter")
    result_dokter = cursor.fetchall()

    cursor.execute("SELECT * FROM tbl_dokter")
    result_pesan_dokter = cursor.fetchall()

    closeDb()
    return render_template('index.html', dokter = result_dokter, pesdok = result_pesan_dokter)


@app.route('/tambah/', methods=['GET', 'POST'])
def add_data():
    openDb()
    nama = request.form['nama']
    nim = request.form['nim']
    telpon = int(request.form['telpon'])
    jurusan = request.form['jurusan']    
    tanggal_temu = request.form['tanggal_temu']    
    dokter = request.form['dokter']    
    catatan = request.form['catatan']    
    cursor.execute('INSERT INTO tbl_pasien (nim, nama, jurusan, no_hp) VALUES (%s, %s, %s, %s)', (nim, nama, jurusan, telpon))
    db.commit()

    cursor.execute('INSERT INTO tbl_rawat (pasien, dokter, tanggal_temu, catatan) VALUES (%s, %s, %s, %s)', (nim, dokter, tanggal_temu, catatan))
    db.commit()
    return redirect(url_for('index'))
    


# --------------------------- Administrasi-----------------------#


@app.route('/admin')
def admin():
    openDb()
    cursor.execute("SELECT * FROM `admin_pasien`")
    result_pasien = cursor.fetchall()

    return render_template('admin/admin.html', result = result_pasien)


@app.route('/admin/datapasien/<string:nim>', methods = ['GET'])
def update_pasien(nim):
    openDb()
    sql = "UPDATE tbl_rawat SET status='Selesai' where pasien='{}'" .format(nim)
    cursor.execute(sql)
    db.commit()
    return redirect(request.referrer)
    
@app.route('/admin/delete/ <string:nim>', methods=['GET'])
def admin_delete_pasien(nim):
    openDb()
    sql = "DELETE FROM tbl_rawat WHERE pasien='{}'" .format(nim)
    cursor.execute(sql)
    db.commit()
    return redirect(request.referrer)
    


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8000, debug=True)