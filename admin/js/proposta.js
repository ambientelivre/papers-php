/* $Id$ */

function chStatus()
{
  if ((document.f1.status.value == 'a') || (document.f1.status.value == 'p'))
  {
  }
  else
  {
    alert("ATEN��O: Marcar a proposta com esse status implica na retirada autom�tica da grade ao ser salva.");
  }
}

function chEspSt()
{
  if ((! ((document.f1.status.value == 'a') || (document.f1.status.value == 'p'))) && (document.f1.espaco.value.length > 0))
  {
    alert('Voc� s� pode colocar uma palestra na grade se ela estiver aprovada ou pr�-aprovada.');
    
    return false;
  }
}

function checkEspaco()
{
  if (document.f1.espaco.value.length > 0)
  {
    chesp = window.open('checkEspaco/' + document.f1.espaco.value, 'chesp', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,resizable=yes,width=400,height=120');
    chesp.focus();
  }
  else
  {
    alert('Informe o espa�o para verificar a disponibilidade.');
  }
}
