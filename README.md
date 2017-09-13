# chrony

#### Tabla de conteudo

1. [Descrição](#Descrição)
2. [Setup - Guia básico para utilizar o módulo](#setup)

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
	servers => ['a.ntp.br', 'b.ntp.br'],
}
```

### Configurando modulo para gerenciar o estado do serviço

```puppet
class { '::chronyd':
	servers => ['a.ntp.br', 'b.ntp.br'],
	service_manage => false,
}
```
