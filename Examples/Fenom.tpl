{* Операторы *}
	{* Арифметические операторы *}
	{-$a}
	{$a + $b}
	{$a - $b}
	{$a / $b}
	{$a * $b}
	{$a % $b}
	{$a < $b}
	{$a + $b * $c/$d - $e*5 + 1e3}

	{* Логические операторы *}
	{$a || $b}
	{$a && $b}
	{!$a}
	{$a or $b}
	{$a and $b}
	{$a xor $b}
	{if $b && $c} ... {/if}

	{* Операторы сравнения *}
	{$a < $b }
	{$a > $b }
	{$a <= $b }
	{$a >= $b }
	{$a == $b }
	{$a === $b}
	{$a !== $b}
	{$a != $b }
	{$a <> $b }
	{if $b >= 5} ... {/if}

	{if 0 == "a"} {* 0 == 0 -> true *} {/if}
	{if "1" == "01"} {* 1 == 1 -> true *} {/if}
	{if "10" == "1e1"} {* 10 == 10 -> true *} {/if}
	{if 100 == "1e2"} {* 100 == 100 -> true *} {/if}

	{* Оператор присваивания *}
	{$a = $b }
	{$a += $b }
	{$a -= $b }
	{$a *= $b }
	{$a /= $b }
	{$a %= $b }
	{$a &= $b }
	{$a |= $b }
	{$a ^= $b }
	{$a <<= $b}
	{$a >>= $b}
	{set $b |= $flags}

	{* Операторы инкремента и декремента *}
	{++$a}
	{$a++}
	{--$a}
	{$a--}

	{$a ~ $b}



{* Синтаксис *}
	{$foo.bar.baz}
	{$foo.$bar.$baz}
	{$foo[5].baz}
	{$foo[5].$baz}
	{$foo.bar.baz[4]}
	{$foo[ $bar.baz ]}
	{$foo[5]}
	{$foo.5}
	{$foo.bar}
	{$foo.'bar'}
	{$foo."bar"}
	{$foo['bar']}
	{$foo["bar"]}
	{$foo.$bar}
	{$foo[$bar]}
	{$foo->bar}
	{$foo->bar.buz}
	{$foo->bar.buz[ $bar->getId("user") ]}
	{$foo->bar(5)->buz(5.5)}

	{* Системная переменная *}
	{$.env} — массив $_ENV.
	{$.get} — массив $_GET.
	{$.post} — массив $_POST.
	{$.files} — массив $_FILES.
	{$.cookie} — массив $_COOKIE.
	{$.server} — массив $_SERVER.
	{$.session} — массив $_SESSION.
	{$.globals} — массив $GLOBALS.
	{$.request} — массив $_REQUEST.
	{$.tpl.name} — возвращает текущее название шаблона.
	{$.tpl.basename} — возвращает текущее название шаблона без схемы.
	{$.tpl.scm} — возвращает схему шаблона.
	{$.tpl.options} — возвращает параметры шбалона в виде целого числа.
	{$.tpl.depends} — возвращает массив шаблонов на которые ссылается текущий шаблон.
	{$.tpl.time} — возвращает штамп времени когда шаблон последний раз менялся
	{$.version} — возвращает версию Fenom.
	{$.const} — обращение к PHP константе: $.const.PHP_EOL обращение к константе PHP_EOL. Поддерживается пространство имен которое разделяется через точку: $.const.Storage.FS::DIR_SEPARATOR обращение к PHP константе Storage\FS::DIR_SEPARATOR если такой констатнты нет будет взята константа Storage\FS\DIR_SEPARATOR.
	{$.php} — обращение к статическомому методу. $.php.Storage.FS::put($filename, $data) обращение к методу Storage\FS::put($filename, $data). $.php.Storage.FS.put($filename, $data) Storage\FS\put($filename, $data)
	{set $ferch = $.fetch($name, $values)} — реализует метод Fenom::fetch() в шаблоне. $name — имя шаблона, $values — дополнительные переменные, которые будут добавлены к существующим. Функция позволяет получить резуьтат работы шаблона в переменную.


{* Теги *}

	{set $v = 5}
	{set $v = "value"}
	{set $v = $x+$y}
	{set $v = 4}
	{set $v = $z++ + 1}
	{set $v = --$z}
	{set $v = $y/$x}
	{set $v = $y-$x}
	{set $v = $y*$x-2}
	{set $v = ($y^$x)+7}

	{set $v = [1,2,3]}
	{set $v = []}
	{set $v = ["one"|upper => 1, 4 => $x, "three" => 3]}
	{set $v = ["key1" => $y*$x-2, "key2" => ["z" => $z]]}

	{set $v = count([1,2,3])+7}

	{autoescape true}
		...
		Text: {$text} {* value of the variable $text will be escaped *}
		...
	{/autoescape}

	{autotrim true}
		...
		Text: {$text} {* value of the variable $text will be escaped *}
		...
	{/autotrim}

	{for $i=$a.c..}
		<div class="{cycle ["odd", "even"]}">
	{/for}


	{for $i=$a.c..}
		<div class="{cycle ["odd", "even"] index=$i}">
	{/for}

	{extends 'parent.tpl'}

	{extends $parent_tpl}

	{block bk1}content 1{/block}
		...
	{block 'bk2'}content 2{/block}

	{block "bk{$number}"}content {$number}{/block}
		...
	{if $condition}
		{block "bk-if"}content, then 'if' is true{/block}
	{else}
		{block "bk{$fail}"}content, then 'if' is false{/block}
	{/if}

	{use 'blocks.tpl'}

	{block 'block1'}
		content ...
		{parent}
		content ...
	{/block}

	{filter|strip_tags|truncate:20}
		Remove all HTML <b>tags</b> and truncate {$text} to 20 symbols
	{/filter}

	{foreach $list as [$key =>] $value [index=$index] [first=$first] [last=$last]}
		{* ...code... *}
	{break}
		{* ...code... *}
	{continue}
		{* ...code... *}
	{foreachelse}
		{* ...code... *}
	{/foreach}

	{if <expression>}
		{* ...code... *}
	{elseif <expression>}
		{* ...code... *}
	{else}
		{* ...code... *}
	{/if}

	{ignore}
		var data = {"time": obj.ts};
	{/ignore}

	{if:ignore $cdn.yandex}
		var item = {cdn: "//yandex.st/"};
	{/if}
	{script:ignore} ... {/script}
	{foreach:ignore ...} ... {/foreach}

	{include "about.tpl" page=$item limit=50}

	{insert 'b.tpl'}

	{macro plus($x, $y, $z=0)}
		x + y + z = {$x + $y + $z}
	{/macro}

	{import 'math.tpl'}

	{import [plus, minus, exp] from 'math.tpl' as math}

	{autoescape true}
		...
		{$var|up} {* escape *}
		{raw $var|up} {* unescape *}
		...
		{"name is: <b>{$name|low}</b>"} {* escape *}
		{raw "name is: <b>{$name|low}</b>"} {* unescape *}
		...
	{/autoescape}

	{autoescape true}
		...
		{my_func page=5} {* escape *}
		{my_func:raw page=5} {* unescape *}
		...
	{/autoescape}

	{switch $type}
	{case 'new'}
		It is new item
	{case 'current', 'new'}
		It is new or current item
	{case 'current'}
		It is current item
	{case 'new', 'newer'}
		It is new item, again
	{case default}
		I don't know the type {$type}
	{/switch}

	{unset $a $b $c.d.e} multiple unset
	



{* Модификаторы *}
	{$ts|date_format:"%Y/%m/%d %H:%M:%s"} outputs 2013/02/08 21:01:43
	{$string|ematch:$pattern}
	{$string|ereplace:'/(\w+) (\d+), (\d+)/i':'${1}1, $3'} {* April1, 2014 *}
	{$post.title|escape:'html'}
	{$string|esplit:$pattern = '/,\s*/'}
	{if $number|in:[1, 3, 42]}
		...
	{/if}
	{$string|join:$delimiter = ","}
	{if $images|length > 5}
		to many images
	{/if}

	{$name|upper}
	{$name|up}
	{if $color|match:"*gr[ae]y"}
		some form of gray ...
	{/if}
	{$fruits|replace:"pear":"orange"}
	{$string|split:$delimiter = ","}
	{"   one    two   "|strip} => 'one two'
	{$long_string|truncate:$length:$etc:$by_words:$middle}


