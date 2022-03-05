
//import myJson from '../hello/test.json' ;
function readJson () {
    var jsonData = {};
    console.log(jsonData)
    return jsonData;
}
function readTextFile(file, callback) {
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, true);
    rawFile.onreadystatechange = function() {
        if (rawFile.readyState === XMLHttpRequest.HEADERS_RECEIVED && rawFile.status === "200") {
            callback(rawFile.responseText);
        }else if(rawFile.readyState === XMLHttpRequest.DONE)
        {
            if(rawFile.status != 200)
            {
                console.log("!!!Network connection failed!")
            } else
            {
                console.log("got some results!");
                if(rawFile.responseText == null) { }
                else {
                    console.log("result: ", rawFile.responseText)
                    var json = JSON.parse('' + rawFile.responseText+ '');

                    json["status"] = "OK";
                    callback.update(json);
                }
            }
        }
    }
    rawFile.send();
}

