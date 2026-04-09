# 🛒 Modelagem e Análise de Dados: E-commerce & Marketplace

Este repositório contém o projeto lógico completo de um banco de dados relacional para um cenário de E-commerce e Marketplace, desenvolvido como desafio final da Formação SQL da Digital Innovation One (DIO).

## 🎯 Objetivo do Projeto e Visão de Negócios (FP&A)
O objetivo deste projeto foi ir além da simples criação de tabelas (DDL). A arquitetura foi desenhada para suportar análises financeiras e de Controladoria (DQL), respondendo a perguntas complexas sobre comportamento de clientes, compliance de fornecedores e rentabilidade de pedidos.

## 🛠️ Estrutura do Projeto

O projeto foi dividido em 3 fases estruturais:

1. **Fase 1: Esquema Lógico (DDL)**
   - Modelagem de tabelas com distinção de Pessoa Física e Jurídica.
   - Suporte a múltiplos métodos de pagamento por cliente.
   - Integração do ecossistema de Marketplace (Vendedores Terceiros) e Supply Chain (Estoque e Fornecedores).
   - Rastreabilidade de status de entrega de pedidos.

2. **Fase 2: Persistência de Dados (DML / Mock Data)**
   - Script SQL (`mock_ecommerce.sql`) com massa de dados simulada.
   - Inserção de "Stress Tests" nas regras de negócio (Ex: O mesmo CNPJ atuando como Fornecedor e Vendedor Terceiro).

3. **Fase 3: Relatórios de Controladoria (DQL)**
   - Script SQL (`queries_ecommerce.sql`) com consultas complexas.
   - Utilização avançada de `JOINs`, `GROUP BY`, `HAVING`, `ORDER BY` e **Atributos Derivados** para calcular Ticket Médio e filtrar pedidos de alto valor.

## 📊 Diagrama Entidade-Relacionamento (MER)
Abaixo está a representação visual da arquitetura do banco de dados gerada a partir das chaves primárias e estrangeiras:

![Diagrama ERP E-commerce](Diagrama.drawio(2).png)
