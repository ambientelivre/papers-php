<h2>{#notRegistered#}</h2>

<p>{#notRegisteredContinue#}</p>

<h2>{#alreadyRegistered#}</h2>

<table style='margin: auto'>
  <form action="" method='POST'>
    <tr>
      <th>E-mail</th>
      <td><input type='text' name='username' size='25'/></td>
    </tr>
    <tr>
      <th>{#password#}</th>
      <td><input type='password' name='password' size='10'/></td>
    </tr>
    <tr>
      <td></td>
      <td>
          <input type='submit' value='{#login#} !'/>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <p><a href='lostPassword'>{#lostMyPassword#}</a></p>
      </td>
    </tr>
  </form>
</table>
