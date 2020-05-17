<?php

$file = fopen('testfile.txt', 'w');
fwrite($file, 'test');
fclose($file);


return \PhpCsFixer\Config::create()
    ->setRules([
        '@PSR2' => true,
        '@Symfony' => true,
        'array_syntax' => ['syntax' => 'short'],
    ])
    ->setUsingCache(false)
;
