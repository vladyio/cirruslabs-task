App URL: https://app-vypf.onrender.com/

• **Ruby**: locally started with 3.3.0.preview2, but Render seems to not able to support it. So
switched to 3.2.2

• **Rails**: 7.0 (latest 7.2alpha is not compatible with `activerecord-postgis-adapter`)

• **PostgreSQL**: 15 (from Render.com).

Latest PSQL 16 is not compatible with `postgis` standalone binary.
I used the latest PostGIS container based on PostgreSQL 16 in Docker locally for development

**Specs cover**:

- routes
- models
- controllers

Gems for testing:

- factory_bot_rails
- faker
- rails-controller-testing
- rspec-rails

---

> [!NOTE]
> Incoming `POST` request is expected at the `/tickets` endpoint.

JSON from request gets parsed & transformed with `Mappers::TicketParamsMapper`,
which uses [dry-transformer](https://dry-rb.org/gems/dry-transformer/1.0/) and
[dry-inflector](https://dry-rb.org/gems/dry-inflector/1.0/).

Then I split the resulting hash into `Ticket` attributes and `Excavator` attributes.

To store `Excavator#address`, I implemented `Excavator#create_with_attrs` method,
that accepts `ticket` and excavator attributes and joins all address parts into a single string and
stores into the `address` field.

> [!NOTE]
> I've removed all unused folders, including `assets`, since it basically bloats the project structure
