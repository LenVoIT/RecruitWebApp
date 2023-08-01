/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function starry (instance) {
  if (instance.max === undefined) { instance.max = 5; }
  if (instance.now === undefined) { instance.now = 0; }
  if (instance.now > instance.max) { instance.now = instance.max; }
  if (instance.disabled === undefined) { instance.disabled = false; }
 
  instance.target.classList.add("starwrap");
  for (let i=1; i<=instance.max; i++) {
    let s = document.createElement("div");
    s.className = "star";
    instance.target.appendChild(s);

    if (i <= instance.now) { s.classList.add("on"); }
    if (!instance.disabled) {
      s.onmouseover = () => {
        let all = instance.target.getElementsByClassName("star");
        for (let j=0; j<all.length; j++) {
          if (j<i) { all[j].classList.add("on"); }
          else { all[j].classList.remove("on"); }
        }
      };
 
      if (instance.click) { s.onclick = () => { instance.click(i); }; }
    }
  }

  instance.target.getstars = () => {
    return instance.target.querySelectorAll(".on").length;
  };
}