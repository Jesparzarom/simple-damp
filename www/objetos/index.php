<?

class Persona
{
    public $nombre = "Juan";
    public $apellido = "Perez";
    public function saludar()
    {
        return "Hola, mi nombre es " . $this->nombre . " " . $this->apellido;
    }

}
$persona = new Persona();
echo var_dump(new Persona());
echo$persona->saludar();