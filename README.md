[Simple Form Logo](https://raw.github.com/plataformatec/simple_form/master/simple_form.png)

By [Plataformatec](http://plataformatec.com.br/).

Rails forms made easy.

**Simple Form** aims to be as flexible as possible while helping you with powerful components to create
your forms. The basic goal of **Simple Form** is to not touch your way of defining the layout, letting
you find the better design for your eyes. Most of the DSL was inherited from Formtastic,
which we are thankful for and should make you feel right at home.

INFO: This README is [also available in a friendly navigable format](http://simple-form.plataformatec.com.br/)
and refers to **Simple Form** 3.1. For older releases, check the related branch for your version.

## Installation

Add it to your Gemfile:

```ruby
gem 'simple_form'
```

Run the following command to install it:

```console
bundle install
```

Run the generator:

```console
rails generate simple_form:install
```

Also, if you want to use the country select, you will need the
[country_select gem](https://rubygems.org/gems/country_select), add it to your Gemfile:

```ruby
gem 'country_select'
```

### Bootstrap

**Simple Form** can be easily integrated to the [Bootstrap](http://getbootstrap.com/).
To do that you have to use the `bootstrap` option in the install generator, like this:

```console
rails generate simple_form:install --bootstrap
```

You have to be sure that you added a copy of the [Bootstrap](http://getbootstrap.com/)
assets on your application.

For more information see the generator output, our
[example application code](https://github.com/rafaelfranca/simple_form-bootstrap) and
[the live example app](http://simple-form-bootstrap.plataformatec.com.br/).

### Zurb Foundation 5

To generate wrappers that are compatible with [Zurb Foundation 5](http://foundation.zurb.com/), pass
the `foundation` option to the generator, like this:

```console
rails generate simple_form:install --foundation
```

Please note that the Foundation wrapper does not support the `:hint` option by default. In order to
enable hints, please uncomment the appropriate line in `config/initializers/simple_form_foundation.rb`.
You will need to provide your own CSS styles for hints.

Please see the [instructions on how to install Foundation in a Rails app](http://foundation.zurb.com/docs/applications.html).

## Usage

**Simple Form** was designed to be customized as you need to. Basically it's a stack of components that
are invoked to create a complete html input for you, which by default contains label, hints, errors
and the input itself. It does not aim to create a lot of different logic from the default Rails
form helpers, as they do a great job by themselves. Instead, **Simple Form** acts as a DSL and just
maps your input type (retrieved from the column definition in the database) to a specific helper method.

To start using **Simple Form** you just have to use the helper it provides:

```erb
<%= simple_form_for @user do |f| %>
  <%= f.input :username %>
  <%= f.input :password %>
  <%= f.button :submit %>
<% end %>
```

This will generate an entire form with labels for user name and password as well, and render errors
by default when you render the form with invalid data (after submitting for example).

You can overwrite the default label by passing it to the input method. You can also add a hint or
even a placeholder. For boolean inputs, you can add an inline label as well:

