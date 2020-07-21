var db = Database.LocalStorage.openDatabaseSync("Clicker", "1.0", "Clicker SQL Database", 1000000);

// That's fully working sql function
function sql(query, specials, callback, err) {
    try {
        db.transaction(
            function(tx) {
                if (specials) {
                    var result = tx.executeSql(query, specials)
                } else {
                    var result = tx.executeSql(query)
                }
                if (callback) {
                    callback(result)
                }
            }
        )
    } catch (e) {
        if (err) {
            err(e)
        }
    }
}

function set(id, val) {
    var query = "INSERT INTO keyval(id,val) VALUES (?,?)"
    var specials = [ id, val ]
    // Call our query
    sql(query, specials, false, function (e) {
        // In case of error update.
        sql("UPDATE keyval SET val=? WHERE id=?", [val,id])
    })
}

function get(id, callback) {
    try {
        function callbackEdited (res) {
            callback(res.rows.item(0).val);
        }
        sql("SELECT val FROM keyval WHERE id = ?", [id], callbackEdited, function (x) {callback(0)})
    } catch (e) {
        callback(0);
    }
}

// Create keyval table
sql("CREATE TABLE IF NOT EXISTS keyval(\
    id TEXT PRIMARY KEY,\
    val TEXT NOT NULL\
)")
