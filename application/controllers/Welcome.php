<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->model('M_User');
		$username 	= "hady18059si";
		$password 	= '0110118059';
		$options = [
			'cost' => 12,
		];
		$hash		= hash($password);
		echo "Bcrypt : $hash";
		echo "<br>";
		echo 'Hash : $2y$12$Nn/iT6/TQzAwae0u8C4weelj9HaJVc5KrQaOH7A6sD2klLxRFKQx.';

		// $get		= $this->M_User->cek_user($username, $hash);
		// print_r($get->result());
		// echo $hash;

		// $getAll = $this->M_User->get_Alluser()->result();
		// print_r($getAll);

		// $mhs = $this->db->get('mahasiswa')->result();
		// print_r($mhs);
	}
}
