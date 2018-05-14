var koefficient = 0.000333;
var calc = {
 koef :  0,
 credit: 0,
 days:   0,
 execute  : function(_rate, _credit, _days){
	this.init(_rate, _credit, _days);
	if(this.validate){
 		this.prepare();
		return this.perform();
	}
	else
		return 'error';
 },
 prepare  : function(){
	 this.credit = parseInt(this.credit);
	 this.days   = parseInt(this.days);
 },
 init     : function(_rate, _credit, _days){
	this.koef   = _rate;
	if(_credit != undefined) this.credit = _credit;
	if(_days != undefined) this.days   = _days;
 },
 validate : function(){
  var result = true;
  if((this.credit < 1000) && (this.credit > 35000)) result = false;
  if((this.days < 5) && (this.days > 45)) result = false;
  return result;
 },
 getmonth : function(_month){
  switch(_month){
   case 0 : return " января ";
   case 1 : return " февраля ";
   case 2 : return " марта ";
   case 3 : return " апреля ";
   case 4 : return " мая ";
   case 5 : return " июня ";
   case 6 : return " июля ";
   case 7 : return " августа ";
   case 8 : return " сентября ";
   case 9 : return " октября ";
   case 10: return " ноября ";
   case 11: return " декабря "; 
  }
 }, 
 convert  : function(_days){
	var date = new Date();
	date.setDate(date.getDate() + _days);
	return date.getDate() + this.getmonth(date.getMonth())+date.getFullYear();
 },
 perform  : function(){
  var out = {
	sum : this.credit + this.credit * this.days * this.koef,
	day : this.convert(this.days)
  };
  return out;  
 }
}

 $(document).ready(function(){
 $('.up').on('click', function() {
      var btn = $(this);
	  var input = btn.closest('.spinner').find('input');
      var step = parseInt(input.attr('step'));
	  if (input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max'))) {    
        input.val(parseInt(input.val(), 10) + step);
      } else {
        btn.next("disabled", true);
      }
    });
    
	$('.down').on('click', function() {
      var btn = $(this);
      var input = btn.closest('.spinner').find('input');
      var step = parseInt(input.attr('step'));
	  if (input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min'))) { input.val(parseInt(input.val(), 10) - step); } 
	  else {
        btn.prev("disabled", true);
      }
    });
  
 $('input').on('keydown keyup keypress', function(){ return false; });
 
 $('.calculate').on('click', function(){
	 var value = calc.execute(koefficient, $('#credit').val(), $('#days').val());
	$('.calc-amount span').html(value.sum);
	$('.calc-date span').html(value.day);
 });
 
 });