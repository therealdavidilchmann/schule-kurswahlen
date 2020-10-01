
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

const copyToClipboard = (copyText) => {
    copyText.select();
    copyText.setSelectionRange(0, 99999)
    document.execCommand("copy");
}