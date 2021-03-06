program ListaPodwojnieWiazana;

uses CRT;

//Typ wskaznikowy do pojedynczego elementu kolejki:
type ElementP = ^Element;

//Pojedynczy element kolejki:
Element = record
  Nr : integer;
  Pop, Nast : ElementP;
  Wartosc : integer;
  end;

//Funkcja dodajaca element do listy, PO elemencie na ktory wsazuje wskaznik 'wczesniejszy':
//lub dodajaca element PRZED elementem na ktory wskazuje wskaznik 'pozniejszy':
function dodaj(wczesniejszy : ElementP; pozniejszy : ElementP; Nr : integer) : ElementP;
//newP - nowy element listy, pomocniczy - wskaznik pomocniczy:
var newP : ElementP;
begin
  new(newP);
  //Prosimy uzytkownika o podanie Nr:
  Write('Podaj numer obiektu ktory ma zostac dodany:');
  Readln(Nr);

  newP^.Nr := Nr;

  dodaj := newP;

  //Sprawdzamy, czy element 'wczesniejszy' istnieje:
  if wczesniejszy <> NIL then
  begin
       newP^.Pop := wczesniejszy;
       newP^.Nast := wczesniejszy^.Nast;
       if wczesniejszy^.Nast <> NIL then wczesniejszy^.Nast^.Pop := newP;
       wczesniejszy^.Nast := newP;
  //Jesli wczesniejszy element nie isnieje to sprawdzamy element 'pozniejszy':
  end else if pozniejszy <> NIL then
      begin
           newP^.Pop := pozniejszy^.Pop;
           newP^.Nast := pozniejszy;
           pozniejszy^.Pop^.Nast := newP;
           pozniejszy^.Pop := newP;
      end else
          begin
               newP^.Nast := NIL;
               newP^.Pop := NIL;
          end;

end;

//Funkcja usuwajaca element z listy, po elemencie na ktory wsazuje wskaznik 'element':
function usun(element : ElementP) : ElementP;
//'pomocniczy' - wskaznik pomocniczy:
var pomocniczy : ElementP;
begin
  if element <> NIL then
  begin
       //UWAGA opisy wzgledem obiektu 'element'!!!
       //Wskaznik z elementu nastepnego zaczyna wskazywac na element poprzedni
       if element^.Pop <> NIL then element^.Pop^.Nast := element^.Nast;
       //Wskaznik z elementu poprzedniego zaczyna wskazywac na element nastepny
       if element^.Nast <> NIL then element^.Nast^.Pop := element^.Pop;
       dispose(element);
  end else Writeln('Blad, element ktory chcesz usunac nie istnieje!!!');
end;

//Funkcja wyszukujace element z listy o zadanym numerze poczawszy od elementu na ktory wsazuje wskaznik 'od':
function szukaj(od : ElementP; Nr : integer) : ElementP;
//'pomocniczy' - wskaznik pomocniczy:
var pomocniczy : ElementP;
begin
  szukaj := NIL;
  pomocniczy := od;

  //Jesli Nr jest rowny 0, to pytamy uzytwkownika o nowy numer:
  if Nr = 0 then
  begin
       Write('Podaj nr obiektu do wyszukania: ');
       Readln(Nr);
  end;

  while pomocniczy <> NIL do
  begin
      if pomocniczy^.Nr = Nr then
      begin
           szukaj := pomocniczy;
           pomocniczy := NIL;
      end else pomocniczy := pomocniczy^.Nast;
  end;
end;

//Funkcja wypisujaca elementy z listy poczawszy od elementu na ktory wsazuje wskaznik 'od':
function wypisz(od : ElementP) : integer;
//pomocniczy - wskaznik pomocniczy:
var pomocniczy : ElementP;
begin
  pomocniczy := od;
  while pomocniczy <> NIL do
  begin
      Write(pomocniczy^.Nr, ' ');
      pomocniczy := pomocniczy^.Nast;
  end;
  Writeln();

end;

var
  //Wskazniki do poczatku i konca listy:
  poczatek, koniec : ElementP;
  //Pierwszy
  poczatkowy : ElementP;
  //Zmienna na przechowywanie decyzji uzytkownika o tym, co nastepnie wykonac:
  coZrobic : integer;


begin
  poczatek := NIL;
  koniec := NIL;
  Writeln('Jakis tekst');

  //Na starcie inicjalizujemy jakis poczatkowy element:
  new(poczatkowy);
  poczatkowy^.Nr := 0;
  poczatkowy^.Pop:= NIL;
  poczatkowy^.Nast := NIL;
  poczatek := poczatkowy;

  //Na poczatek przypisujemy 1, by petla glowna wykonala sie choc raz, wartosc nie ma wiekszego znaczenia - ma byc rozna od 0
  coZrobic := 1;

  //Glowna petla sterujaca:
    while coZrobic <> 0 do
    begin
      Writeln('Co chcesz zrobic 1-dodaj element; 2-wypisz elementy; 3-usun element; 4-dodaj elemnt po; 0-koniec;');
      Readln(coZrobic);

      case (coZrobic) of
      1: poczatek := dodaj(poczatkowy, NIL, 0);
      2: wypisz(poczatkowy);
      3: usun(szukaj(poczatek, 0));
      4: dodaj(szukaj(poczatek, 0), NIL, 0);
      end;
    end;
  end.
















