Prezado(a) {$person.nome},

Sua submiss�o para o "{$event.name}",
com t�tulo "{$proposal.titulo}",
foi recebida para avalia��o.

{if $event.allow_submission_update}
Antes do final do prazo para submiss�o, voc� pode atualizar sua submiss�o
atrav�s do website:
{$event.papers_url}/speaker/
{/if}

Se a submiss�o foi feita por voc�, ent�o voc� j� tem a sua senha. Caso
contr�rio, use a op��o "Esqueci minha senha" para receber uma nova senha por
e-mail.

--
{$event.name}
e-mail de contato: {$event.contact_email}
