Dragon (version alpha)
======================
* Source: https://python.astrotech.io/dragon/alpha.html
* Assignment: Dragon (version alpha)
* Complexity: medium
* Lines of code: 100 lines
* Time: 89 min, then 144 min live coding with instructor
* Warning: Don't delete code, assignment will be continued

.. figure:: docs/img/dragon.gif

    Firkraag dragon from game Baldur's Gate II: Shadows of Amn


English
-------
1. In your directory create file ``dragon_alpha.py`` with class representing Dragon

2. Dragon has (attributes):

    a. name
    b. position on the screen
    c. texture file name, default ``img/dragon/alive.png``
    d. health points, default random ``int`` in range from 50 to 100

3. Dragon can (methods):

    a. have position set to any place on the screen
    b. make damage in range from 5 to 20
    c. take damage
    d. move in any direction by specified value

4. Assume left-top screen corner as an initial coordinates position:

    a. going right add to ``x``
    b. going left subtract from ``x``
    c. going up subtract from ``y``
    d. going down add to ``y``

5. When health points drop to, or below zero:

    a. Dragon is dead
    b. Set object status to dead
    c. Change texture file name to  ``img/dragon/dead.png``
    d. Print ``XXX is dead``, where ``XXX`` is the dragon's name
    e. Print how much gold dragon dropped (random integer from 1 to 100)
    f. Print position where dragon died

6. Run the game:

    a. Create dragon at x=50, y=120 position and name it "Wawelski"
    b. Set new position to x=10, y=20
    c. Move dragon left by 10 and down by 20
    d. Move dragon left by 10 and right by 15
    e. Move dragon right by 15 and up by 5
    f. Move dragon down by 5
    g. Dragon makes damage
    h. Make 10 points damage to the dragon
    i. Make 5 points damage to the dragon
    j. Make 3 points damage to the dragon
    k. Make 2 points damage to the dragon
    l. Make 15 points damage to the dragon
    m. Make 25 points damage to the dragon
    n. Make 75 points damage to the dragon

Non-functional requirements:

    a. Assignment is simulation of a software development process.
    b. Assignment is a business requirements specification.
    c. Solution must fulfill all the acceptance criteria.
    d. How to implement those criteria is up to you.
    e. You - programmer, Instructor - Product Owner.
    f. Product Owner will not help you in architectural decisions.
    g. Do not check neither solution nor future versions (beta and rc).

Post notes:

    b. Trainer acts as Product Owner with little technical knowledge
    c. You are the software engineer who need to decide and live with
       consequences of your choices
    d. Task is a narrative story telling to demonstrate OOP
       and good engineering practices
    e. Calculated last position of the game should be x=20, y=40
    f. You can introduce new fields, methods, functions, variables,
       constants, classes, objects, whatever you want
    g. Don't use modules form outside the Python Standard Library
    h. Task is business requirement specification, not a technical
       documentation, i.e., "what Dragon has to do, not how to do it"
    i. You don't have to keep order of specification while writing code
    j. This is `alpha` version, so no new functionality like
       negative position checking etc.
    l. You can create tests, i.e.: unittest, doctest
    k. Do not read solution or any future iterations of this exercise;
       if you read future tasks, you will spoil fun and learning


Polish
------
1. W swoim katalogu stw??rz plik ``dragon_alpha.py`` a w nim klas?? reprezentuj??c?? Smoka

2. Smok ma (atrybuty):

    a. nazw??
    b. pozycj?? na ekranie
    c. nazw?? pliku tekstury, domy??lnie ``img/dragon/alive.png``
    d. punkty ??ycia, domy??lnie losowy ``int`` z zakresu od 50 do 100

3. Smok mo??e (metody):

    a. by?? ustawiony w dowolne miejsce ekranu
    b. zadawa?? komu?? losowe obra??enia z przedzia??u od 5 do 20
    c. otrzymywa?? obra??enia
    d. by?? przesuwany w kt??rym?? z kierunk??w o zadan?? warto????

4. Przyjmij g??rny lewy r??g ekranu za punkt pocz??tkowy:

    a. id??c w prawo dodajesz ``x``
    b. id??c w lewo odejmujesz ``x``
    c. id??c w g??r?? odejmujesz ``y``
    d. id??c w d???? dodajesz ``y``

5. Kiedy punkty ??ycia Smoka spadn?? do lub poni??ej zera:

    a. Smok jest martwy
    b. Ustaw status obiektu na dead
    c. Zmie?? nazw?? pliku tekstury na ``img/dragon/dead.png``
    d. Wypisz ``XXX is dead``, gdzie ``XXX`` to nazwa smoka
    e. Wypisz ile z??ota smok wyrzuci?? (losowa liczba od 1 do 100)
    f. Wypisz pozycj?? gdzie smok zgin????

6. Przeprowad?? gr??:

    a. Stw??rz smoka w pozycji x=50, y=120 i nazwij go "Wawelski"
    b. Ustaw now?? pozycj?? na x=10, y=20
    c. Przesu?? smoka w lewo o 10 i w d???? o 20
    d. Przesu?? smoka w lewo o 10 i w prawo o 15
    e. Przesu?? smoka w prawo o 15 i w g??r?? o 5
    f. Przesu?? smoka w d???? o 5
    g. Smok zadaje obra??enia (5-20)
    h. Zadaj 10 obra??e?? smokowi
    i. Zadaj 5 obra??e?? smokowi
    j. Zadaj 3 obra??e?? smokowi
    k. Zadaj 2 obra??e?? smokowi
    l. Zadaj 15 obra??e?? smokowi
    m. Zadaj 25 obra??e?? smokowi
    n. Zadaj 75 obra??e?? smokowi
    o. Smok powinien zgin???? na pozycji: x=20, y=40

Wymagania niefunkcjonalne:

    a. **Zadanie jest symulacj?? procesu wytwarzania oprogramowania.**

       Pos??u??y do demonstracji obiektowego paradygmatu programowania,
       i dobrych praktyk programistycznych. Nie piszemy gry i nie b??dziemy
       omawiali specyfiki game-dev. Si???? rzeczy poruszymy kilka kwestii
       z tym zwi??zanych, ale ca??o???? dyskusji znajdzie zastosowanie do
       dowolnego rodzaju projekt??w informatycznych i problem??w in??ynierii
       oprogramowania w dowolnej domenie biznesowej.

    b. **Zadanie jest specyfikacj?? wymaga?? biznesowych.**

       Nie jest to dokumentacja techniczna. Zadanie opisuje "co Smok ma
       robi??", a nie "jak to ma robi??". To wa??na r????nica i zwr???? na to uwag??.
       Z tego powodu nie musisz trzyma?? si?? kolejno??ci punkt??w i podpunkt??w
       w zadaniu, a tak??e rozwi??za?? problemy inaczej ni?? jest napisane.

    c. **Rozwi??zanie musi spe??nia?? kryteria akceptacyjne.**

       Pami??taj, ??e jest to wersja `alpha` wi??c nie wprowadzaj dodatkowych
       niezam??wionych funkcjonalno??ci (np. dodatkowych postaci, sprawdzania
       wychodzenia poza plansz?? itp.)

    d. **Spos??b implementacji jest dowolny.**

       Mo??esz wprowadza?? dodatkowe pola, metody, funkcje, zmienne, sta??e,
       klasy, obiekty, unittest lub doctest, type annotation - co tylko
       chcesz, ale `nie korzystaj z modu????w spoza biblioteki standardowej`.
       Wyj??tkiem mo??e by?? framework do test??w.

    e. **Ty - programista, Prowadz??cy - Product Owner.**

       Przy tym zadaniu wcielisz si?? w rol?? in??yniera oprogramowania
       (programisty), a Prowadz??cy b??dzie zachowywa?? si?? jak Product Owner
       z niewielk?? wiedz?? techniczn?? - 10 lat temu by?? programist??, a teraz
       wi??kszo???? czasu sp??dza w Excelu i na spotkaniach. Pami??taj, ??e
       do??wiadczenie Product Ownera rzutuje na spos??b w jaki pisze kryteria
       akceptacyjne. Jego kariera programisty mo??e powodowa??,
       ??e w specyfikacji wymaga?? pojawi?? si?? kwestie techniczne i sugestie
       jak dany problem rozwi??za??. Musisz to odfiltrowa?? z tre??ci zadania.
       Niestety to bardzo cz??sty scenariusz w bran??y IT.

    f. **Product Owner nie doradzi Ci w sprawie decyzji architektonicznych.**

       Nie podpowie Ci czy lepiej b??dzie zrobi?? to w jaki?? konkretny spos??b,
       albo czy jak zastosujesz to pewne rozwi??zanie to jaki b??dzie wp??yw na
       przysz??o????. Zadanie polega na tym, ??e to Ty musisz podejmowa?? decyzje
       i ponosi?? ich konsekwencje, tj. ??atwa mo??liwo???? wprowadzania zmian w
       przysz??ych wersjach. Musisz znale???? balans, mi??dzy wdro??eniem szybkim
       funkcjonalno??ci, ??atwo??ci?? zrozumienia i utrzymywania kodu i nie
       zablokowaniem sobie drogi na wprowadzanie zmian w przysz??o??ci.
       Pami??taj o TDD, YAGNI, DRY, KISS, emerging architecture
       i over-engineering.

    g. **Nie przegl??daj rozwi??za?? ani tre??ci kolejnych cz????ci zadania.**

       Je??eli zagl??dniesz w prz??d, to zepsujesz sobie zabaw?? i nauk??. To
       zadanie ma niesamowity potencja?? edukacyjny. Nie niszcz go.

Powodzenia i mi??ej zabawy!


Hints
-----
* Shortest possible solution could have 24 lines of code
* ``from random import randint``
* ``randint(a, b)`` - random integer between ``a`` and ``b`` (inclusive!)


Tests
-----
Integration Tests:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m doctest -v test/*.py

Unit Tests:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m unittest discover -v test

Test Coverage:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m coverage run src
    python3 -m coverage xml -o .tmp/coverage.xml

Security Test:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m bandit --format json --output=.tmp/bandit.json --recursive src

Static Tests:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m mypy --ignore-missing-imports --cobertura-xml-report=.tmp src

Code Style:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m flake8 --doctest --output-file=.tmp/flake8.txt src

Lint:

.. code-block:: sh

    export PYTHONPATH=src
    python3 -m pylint --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" --output=.tmp/pylint.txt --disable=C0114,C0115,C0116,E0401,C0103 src
    python3 -m pylama --verbose --async src/

Mutation Testing:

.. code-block:: sh

    mutmut run || true
    mutmut results
    mutmut junitxml --suspicious-policy=ignore --untested-policy=ignore > .tmp/xunit.xml

Test Report:

.. code-block:: sh

    docker run --rm --net=ecosystem -v $(pwd):/usr/src sonarsource/sonar-scanner-cli

Errors:

* C0114 - missing-module-docstring
* C0115 - missing-class-docstring
* C0116 - missing-function-docstring
* E0401 - import-error
* C0103 - invalid-name (errors on ``x`` and ``y`` attribute names)


Package
-------
.. code-block:: sh

    python3 -m pip install --upgrade --no-cache-dir -r requirements.prod --target src
    rm -fr src/*.dist-info
    python3 -m compileall -f src
    # find src -name '*.py' -not -name '__main__.py' -not -name '__init__.py' -delete  # not working for now
    python3 -m zipapp --python="/usr/bin/env python3" --output=game.pyz src

.. code-block:: sh

    unzip -l game.pyz


Docker
------
.. code-block:: dockerfile

    FROM python:3.10
    COPY game.pyz /game.pyz
    CMD python3 /game.pyz
