program project1;

uses CRT;

//Typ wskaznikowy do pojedynczego elementu kolejki:
type ElementP = ^Element;

//Pojedynczy element kolejki:
Element = record
  Nr : integer;
  Pop, Nast : ElementP;
  Wartosc : integer;
  end;

//Funkcja dodajaca element do listy, po elemencie na ktory wsazuje wskaznik wczesniejszy:

//Funkcja usuwajaca element z listy, po elemencie na ktory wsazuje wskaznik wczesniejszy:

//Funkcja wyszukujace element z listy o zadanym numerze poczawszy od elementu na ktory wsazuje wskaznik wczesniejszy:


VAR
  //Wskazniki do poczatku i konca listy:
  poczatek, koniec : ElementP;
  //Zmienna na przechowywanie decyzji uzytkownika o tym, co nastepnie wykonac:
  coZrobic : integer;


begin
  Writeln('Jakis tekst');

  Readln();
  end.
