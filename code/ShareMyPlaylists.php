<?php

/**
  * playlist.net PHP SDK
  * URL : https://github.com/ShareMyPlaylists/ShareMyPlaylists_PHP
  * Document: http://playlists.net/api/documentation
  *
  *  Happy Hacking!!
  */
class ShareMyPlaylists_Api
{
	protected $public_key = null;
	protected $private_key = null;

	protected $api_base    = 'http://sharemyplaylists.com/api/';
	protected $api_version = '2';
	protected $api_auth    = 'signed_sha256';

	public function __construct( $public_key = null, $private_key = null )
	{
		if( empty($public_key) || empty($private_key) )
		{
			throw new Exception("No public or private key defined.");
		}

		$this->public_key = $public_key;
		$this->private_key = $private_key;
	}

	public function api($method, $parameters = array())
	{
		$timestamp = (time() - date("Z"));

		$signature = $this->public_key.$this->private_key.$timestamp;
		$signature = hash('sha256', $signature);

		$parameters['public_key'] = $this->public_key;
		$parameters['timestamp'] = $timestamp;
		$parameters['signature'] = $signature;

		$uri = $this->api_base.'v'.$this->api_version.'?method=smp.'.$method.( !empty($parameters) ? '&'.http_build_query($parameters) : '' );

		$data = $this->getUri( $uri );
		$data = $this->processReponse( $data );

		return $data;
	}

	protected function processReponse( $data = data )
	{
		return json_decode($data, true);
	}

	protected function getUri($uri, $post = false)
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $uri);
		curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.15) Gecko/20110303 Firefox/3.6.15");
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);

		if( $post === true )
		{
			curl_setopt($ch, CURLOPT_POST, true);
		}

		$output = curl_exec($ch);
		curl_close($ch);


		return $output;		
	}
}

?>