class Notification {

  success() {
    new Noty({
      type: 'success',
      layout: 'topRight',
      text: 'Successfully Done!',
      timeout: 1000,
    }).show();
  }


  alert() {
    new Noty({
      type: 'alert',
      layout: 'topRight',
      text: 'Are you Sure?',
      timeout: 1000,
    }).show();
  }



  error() {
    new Noty({
      type: 'alert',
      layout: 'topRight',
      text: 'Something Went Wrong ! ',
      timeout: 1000,
    }).show();
  }


  warning() {
    new Noty({
      type: 'warning',
      layout: 'topRight',
      text: 'Oops! Try Again!',
      timeout: 1000,
    }).show();
  }



}

export default Notification = new Notification()