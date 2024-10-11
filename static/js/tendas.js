function rate(num) {
  for (let i = 1; i <= 5; i++) {
    const star = document.getElementsByClassName('star')[i - 1];
    if (i <= num) {
      star.classList.add('checked');
    } else {
      star.classList.remove('checked');
    }
  }
}
