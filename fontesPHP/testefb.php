<!-- https://developers.facebook.com/docs/facebook-login/login-flow-for-web/v2.1 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>

<?php
/*
session_start();

if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['code'])){
// Informe o seu App ID abaixo
  $appId = '1404595923181238';
  // Digite o App Secret do seu aplicativo abaixo:
  $appSecret = 'be3dd13e6b514f3508936830ae925da3';
  // Url informada no campo "Site URL"
  $redirectUri = urlencode('http://beladomes.zz.mu/testefb.php');
  // Obtém o código da query string
  $code = $_GET['code'];

  // Monta a url para obter o token de acesso e assim obter os dados do usuário
  $token_url = "https://graph.facebook.com/oauth/access_token?client_id=$appId&redirect_uri=$redirectUri&client_secret=$appSecret&code=$code";
  //pega os dados
  $response = @file_get_contents($token_url);
  if($response){
    $params = null;
    parse_str($response, $params);
    if(isset($params['access_token']) && $params['access_token']){
      $graph_url = "https://graph.facebook.com/me?access_token=". $params['access_token'];
      $user = json_decode(file_get_contents($graph_url));
 
    // nesse IF verificamos se veio os dados corretamente
      if(isset($user->email) && $user->email){
  
    *Apartir daqui, você já tem acesso aos dados usuario, podendo armazená-los
    *em sessão, cookie ou já pode inserir em seu banco de dados para efetuar
    *autenticação.
    *No meu caso, solicitei todos os dados abaixo e guardei em sessões.
  
        $_SESSION['email'] = $user->email;
        $_SESSION['nome'] = $user->name;
        $_SESSION['localizacao'] = $user->location->name;
        $_SESSION['uid_facebook'] = $user->id;
        $_SESSION['user_facebook'] = $user->username;
        $_SESSION['link_facebook'] = $user->link;
      }
	  
	  echo "<br><br><pre>";
		print_r($user);
	  echo "</pre>";
    }else{
      echo "Erro de do token";
      exit(0);
    }
  }else{
    echo "Erro de conexão com Facebook: $token_url";
    exit(0);
  }
}else if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['error'])){
  echo 'Permissão não concedida';
}
<a href="https://www.facebook.com/dialog/oauth?client_id=1404595923181238&redirect_uri=http://beladomes.zz.mu/testefb.php&scope=email,user_website,user_location">Entrar com Facebook</a>
*/

//define('FACEBOOK_SDK_V4_SRC_DIR', '/facebook-php-sdk-v4-4.0-dev/src/Facebook/');
//require __DIR__ . '/facebook-php-sdk-v4-4.0-dev/autoload.php';
session_start();
require ('facebook-php-sdk-v4-4.0-dev/autoload.php');

use Facebook\FacebookSession;
use Facebook\FacebookRequest;
use Facebook\GraphUser;
use Facebook\FacebookRequestException;
use Facebook\FacebookRedirectLoginHelper;

// Informe o seu App ID abaixo
$appId = '1404595923181238';
  // Digite o App Secret do seu aplicativo abaixo:
$appSecret = 'be3dd13e6b514f3508936830ae925da3';
// Url informada no campo "Site URL"
$redirect_url = 'http://beladomes.zz.mu/testefb.php';  

FacebookSession::setDefaultApplication($appId, $appSecret);

$helper = new FacebookRedirectLoginHelper($redirect_url, $appId, $appSecret);

try {
    $session = $helper->getSessionFromRedirect();
	
	if($session) {
		$_SESSION['token'] = $session->getToken();
		
		$fb_session = new FacebookSession($session->getToken());
				
		$me = (new FacebookRequest(
          $fb_session, 'GET', '/me'
        ))->execute()->getGraphObject(GraphUser::className());
 
        echo 'Olá ' . $me->getName();
        
/*		
        $paginas = (new FacebookRequest(
          $fb_session, 'GET', '/me/accounts'
        ))->execute()->getGraphObject();
         
        $paginas = $paginas->getPropertyAsArray('data');
         
        echo '';
         
        $sel = '<select><option></option>';
         
        foreach ( $paginas as $pagina ){             
            $sel .= '<option>' . $pagina->getProperty('name') . '</option>';             
        }
         
        echo $sel . '</select>' ;
		*/
	} else {
		echo '<a href="' . $helper->getLoginUrl() . '">Login with Facebook</a>';
	}
} catch(FacebookRequestException $ex) {
    echo "Ocorreu uma exceção, código: " . $ex->getCode();
    echo " com a mensagem: " . $ex->getMessage();
} catch(\Exception $ex) {
    echo 'Ocorreu um erro interno.' . $ex->getTraceAsString();
}

?>

</body>
</html>