# chrony

#### Tabla de conteudo

1. [Descrição](#Descrição)
1. [Setup - Guia básico para utilizar o módulo](#setup)
    * [What chrony affects](#what-chrony-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with chrony](#beginning-with-chrony)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Descrição

Esse modulo tem por objetivo instalar e condifigurar o Chrony para ajuste de data e hora

## Setup

### Uso Básico

Para utilizar esse módulo com as configurações padroes:

```puppet
include ::chronyd

ou

class { '::chronyd':
}
```

### Definido os servidores NTP

```puppet
class { '::chronyd':
	servers => ['a.ntp.br', 'b.ntp.br']
}
```

### Configurando modulo para gerenciar o estado do serviço

```puppet
class { '::chronyd':
	servers => ['a.ntp.br', 'b.ntp.br']
	service_manage => false
}
```
