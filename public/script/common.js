

$("#fakeLoader").fakeLoader({
    timeToHide:500, //加载效果的持续时间
    zIndex:"999",//
    spinner:"spinner1",//可选值 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 对应有7种效果
    bgColor: "#3c8dbc"
});

function initNav(i) {
    var now = document.getElementById("nav"+i);
    now.classList.add("active");
}
function initMark() {
    var content = document.getElementsByClassName("article-content");
    for (var i = 0; i < content.length; i++) {
        var str = content[i].innerHTML;
        str = str.trim();
        var len = str.length;
        str = str.substr(0,Math.min(20, len));
        if (str.length < len)
            str = str + "<br/>...";
        content[i].innerHTML = marked(str);
    }
}

function addEvent(ele, event, handler) {
    if (ele.addEventListener) {
        ele.addEventListener(event, handler);
    }
    else if (ele.attachEvent) {
        ele.attachEvent("on"+event, handler);
    }
    else {
        ele["on"+event] = handler;
    }
}