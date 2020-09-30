const teachers = document.getElementById("teachers");


const onClickSubmit = (e) => {
    e.preventDefault();
    if (teachers.childElementCount == 0) {
        location.href = "../";
    } else {
        alert("Bitte setze alle Lehrer auf ein Feld.");
    }
}

document.getElementById("submit-btn").addEventListener("click", onClickSubmit);


const allowDrop = (ev) => {
    ev.preventDefault();
}

const drag = (ev) => {
    ev.dataTransfer.setData("text", ev.target.id);
}

const drop = (ev) => {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
    if (document.getElementById("teachers").childElementCount == 0) {
        document.getElementById("submit-btn").style.display = "flex";
    } else {
        document.getElementById("submit-btn").style.display = "none";
    }
}