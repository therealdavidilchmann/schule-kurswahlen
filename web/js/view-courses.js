
const switchView = () => {
    const e = document.getElementById("container-switch");
    const list = document.getElementById("list-view");
    const timetable = document.getElementById("timetable-view");
    if (e.classList.contains("right-active")) {
        e.classList.remove("right-active");
        e.classList.add("left-active");
        list.style.display = "none";
        timetable.style.display = "block";
    } else {
        e.classList.remove("left-active");
        e.classList.add("right-active");
        list.style.display = "flex";
        timetable.style.display = "none";
    }
}

document.querySelectorAll(".email-copy-btn").forEach(btn => {
    btn.addEventListener("click", () => {
        try {
            var txt = document.getElementById(btn.id).value;
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val(txt).select();
            var retVal = document.execCommand("copy");
            if (retVal) alert("Erfolgreich die E-Mail kopiert.");
            else alert("Fehler beim kopieren der E-Mail.")
            $temp.remove();
        } catch (err) {
            alert('Error while copying to clipboard: ' + err);
        }
    });
})
