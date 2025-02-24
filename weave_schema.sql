--
-- Name: collaborators; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."collaborators" (
  "role" "text",
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "id" bigint NOT NULL,
  "user" "uuid" NOT NULL,
  "profile" "uuid",
  "owner_site" "uuid" NOT NULL
);

ALTER TABLE
  "public"."collaborators" OWNER TO "postgres";

--
-- Name: collaborators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."collaborators"
ALTER COLUMN
  "id"
ADD
  GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."collaborators_id_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1
  );

--
-- Name: entries; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."entries" (
  "value" "jsonb",
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "locale" "text" DEFAULT 'en' :: "text",
  "index" numeric,
  "metadata" "jsonb",
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "field" "uuid",
  "parent" "uuid",
  "page" "uuid",
  "page_type" "uuid",
  "section" "uuid",
  "symbol" "uuid",
  "site" "uuid",
  "library_symbol" "uuid",
  "owner_site" "uuid"
);

ALTER TABLE
  "public"."entries" OWNER TO "postgres";

--
-- Name: fields; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."fields" (
  "key" "text" NOT NULL,
  "label" "text" NOT NULL,
  "type" "text" NOT NULL,
  "options" "jsonb" DEFAULT '{}' :: "jsonb" NOT NULL,
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "index" smallint DEFAULT '0' :: smallint,
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "symbol" "uuid",
  "page_type" "uuid",
  "site" "uuid",
  "parent" "uuid",
  "source" "uuid",
  "library_symbol" "uuid",
  "owner_site" "uuid"
);

ALTER TABLE
  "public"."fields" OWNER TO "postgres";

--
-- Name: invitations; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."invitations" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "email" "text",
  "role" "text",
  "id" bigint NOT NULL,
  "owner_site" "uuid"
);

ALTER TABLE
  "public"."invitations" OWNER TO "postgres";

--
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."invitations"
ALTER COLUMN
  "id"
ADD
  GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."invitations_id_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1
  );

--
-- Name: library_settings; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."library_settings" (
  "key" "text" NOT NULL,
  "value" "jsonb",
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "owner" "uuid",
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);

ALTER TABLE
  "public"."library_settings" OWNER TO "postgres";

--
-- Name: library_symbol_groups; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."library_symbol_groups" (
  "id" bigint NOT NULL,
  "name" "text",
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "owner" "uuid",
  "index" smallint
);

ALTER TABLE
  "public"."library_symbol_groups" OWNER TO "postgres";

--
-- Name: library_symbol_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."library_symbol_groups"
ALTER COLUMN
  "id"
ADD
  GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."library_symbol_groups_id_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1
  );

--
-- Name: library_symbols; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."library_symbols" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "name" "text",
  "code" "jsonb" DEFAULT '{"js": "", "css": "", "html": ""}' :: "jsonb",
  "index" bigint NOT NULL,
  "owner" "uuid" NOT NULL,
  "id" "uuid" NOT NULL,
  "group" bigint
);

ALTER TABLE
  "public"."library_symbols" OWNER TO "postgres";

--
-- Name: page_types; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."page_types" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "name" "text",
  "code" "jsonb" NOT NULL,
  "color" "text",
  "icon" "text",
  "index" numeric DEFAULT '0' :: numeric,
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "owner_site" "uuid" NOT NULL
);

ALTER TABLE
  "public"."page_types" OWNER TO "postgres";

--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."pages" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "name" "text",
  "slug" "text" NOT NULL,
  "index" numeric DEFAULT '0' :: numeric,
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "page_type" "uuid",
  "parent" "uuid",
  "owner_site" "uuid"
);

ALTER TABLE
  "public"."pages" OWNER TO "postgres";

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."profiles" (
  "id" "uuid" NOT NULL,
  "email" "text",
  "is_full_user" boolean DEFAULT false
);

ALTER TABLE
  "public"."profiles" OWNER TO "postgres";

--
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."sections" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "index" integer,
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "symbol" "uuid",
  "page_type" "uuid",
  "page" "uuid",
  "master" "uuid",
  "palette" "uuid",
  "owner_site" "uuid"
);

ALTER TABLE
  "public"."sections" OWNER TO "postgres";

--
-- Name: site_groups; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."site_groups" (
  "id" bigint NOT NULL,
  "name" "text",
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "owner" "uuid",
  "index" smallint
);

ALTER TABLE
  "public"."site_groups" OWNER TO "postgres";

--
-- Name: site_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."site_groups"
ALTER COLUMN
  "id"
ADD
  GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."site_groups_id_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1
  );

--
-- Name: sites; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."sites" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "name" "text",
  "code" "jsonb" DEFAULT '{"js": "", "css": "", "html": ""}' :: "jsonb",
  "owner" "uuid" NOT NULL,
  "published" boolean DEFAULT false,
  "custom_domain" "text",
  "custom_domain_connected" boolean DEFAULT false,
  "design" "jsonb",
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "ownership_verification" "jsonb",
  "custom_hostname_id" "text",
  "ssl_validation" "jsonb",
  "dns_records" "jsonb",
  "is_starter" boolean DEFAULT false NOT NULL,
  "description" "text",
  "group" bigint
);

ALTER TABLE
  "public"."sites" OWNER TO "postgres";

--
-- Name: symbols; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE "public"."symbols" (
  "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
  "name" "text" DEFAULT '' :: "text",
  "code" "jsonb" DEFAULT '{"js": "", "css": "", "html": ""}' :: "jsonb",
  "index" bigint DEFAULT '0' :: bigint NOT NULL,
  "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
  "owner_site" "uuid" NOT NULL,
  "page_types" "uuid" [] DEFAULT '{}' :: "uuid" [] NOT NULL
);

ALTER TABLE
  "public"."symbols" OWNER TO "postgres";

--
-- Name: collaborators collaborators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."collaborators"
ADD
  CONSTRAINT "collaborators_pkey" PRIMARY KEY ("id");

--
-- Name: entries content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "content_pkey" PRIMARY KEY ("id");

--
-- Name: fields fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_pkey" PRIMARY KEY ("id");

--
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."invitations"
ADD
  CONSTRAINT "invitations_pkey" PRIMARY KEY ("id");

--
-- Name: library_settings library_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_settings"
ADD
  CONSTRAINT "library_settings_pkey" PRIMARY KEY ("id");

--
-- Name: library_symbol_groups library_symbol_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_symbol_groups"
ADD
  CONSTRAINT "library_symbol_groups_pkey" PRIMARY KEY ("id");

--
-- Name: library_symbols library_symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_symbols"
ADD
  CONSTRAINT "library_symbols_pkey" PRIMARY KEY ("id");

--
-- Name: page_types page_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."page_types"
ADD
  CONSTRAINT "page_types_pkey" PRIMARY KEY ("id");

--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."pages"
ADD
  CONSTRAINT "pages_pkey" PRIMARY KEY ("id");

--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."profiles"
ADD
  CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");

--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_pkey" PRIMARY KEY ("id");

--
-- Name: site_groups site_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."site_groups"
ADD
  CONSTRAINT "site_groups_pkey" PRIMARY KEY ("id");

--
-- Name: sites sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sites"
ADD
  CONSTRAINT "sites_pkey" PRIMARY KEY ("id");

--
-- Name: symbols symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."symbols"
ADD
  CONSTRAINT "symbols_pkey" PRIMARY KEY ("id");

--
-- Name: collaborators collaborators_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."collaborators"
ADD
  CONSTRAINT "collaborators_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: collaborators collaborators_profile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."collaborators"
ADD
  CONSTRAINT "collaborators_profile_fkey" FOREIGN KEY ("profile") REFERENCES "public"."profiles"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: collaborators collaborators_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."collaborators"
ADD
  CONSTRAINT "collaborators_user_fkey" FOREIGN KEY ("user") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_field_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_field_fkey" FOREIGN KEY ("field") REFERENCES "public"."fields"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_library_symbol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_library_symbol_fkey" FOREIGN KEY ("library_symbol") REFERENCES "public"."library_symbols"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_page_fkey" FOREIGN KEY ("page") REFERENCES "public"."pages"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_page_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_page_type_fkey" FOREIGN KEY ("page_type") REFERENCES "public"."page_types"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_parent_fkey" FOREIGN KEY ("parent") REFERENCES "public"."entries"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_section_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_section_fkey" FOREIGN KEY ("section") REFERENCES "public"."sections"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_site_fkey" FOREIGN KEY ("site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: entries entries_symbol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."entries"
ADD
  CONSTRAINT "entries_symbol_fkey" FOREIGN KEY ("symbol") REFERENCES "public"."symbols"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: fields fields_library_symbol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_library_symbol_fkey" FOREIGN KEY ("library_symbol") REFERENCES "public"."library_symbols"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: fields fields_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: fields fields_page_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_page_type_fkey" FOREIGN KEY ("page_type") REFERENCES "public"."page_types"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: fields fields_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_parent_fkey" FOREIGN KEY ("parent") REFERENCES "public"."fields"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: fields fields_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_site_fkey" FOREIGN KEY ("site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: fields fields_source_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_source_fkey" FOREIGN KEY ("source") REFERENCES "public"."fields"("id") ON UPDATE CASCADE ON DELETE
SET
  NULL;

--
-- Name: fields fields_symbol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."fields"
ADD
  CONSTRAINT "fields_symbol_fkey" FOREIGN KEY ("symbol") REFERENCES "public"."symbols"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: invitations invitations_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."invitations"
ADD
  CONSTRAINT "invitations_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: library_settings library_settings_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_settings"
ADD
  CONSTRAINT "library_settings_owner_fkey" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: library_symbol_groups library_symbol_groups_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_symbol_groups"
ADD
  CONSTRAINT "library_symbol_groups_owner_fkey" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: library_symbols library_symbols_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_symbols"
ADD
  CONSTRAINT "library_symbols_group_fkey" FOREIGN KEY ("group") REFERENCES "public"."library_symbol_groups"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: library_symbols library_symbols_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."library_symbols"
ADD
  CONSTRAINT "library_symbols_owner_fkey" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: page_types page_types_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."page_types"
ADD
  CONSTRAINT "page_types_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: pages pages_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."pages"
ADD
  CONSTRAINT "pages_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: pages pages_page_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."pages"
ADD
  CONSTRAINT "pages_page_type_fkey" FOREIGN KEY ("page_type") REFERENCES "public"."page_types"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: pages pages_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."pages"
ADD
  CONSTRAINT "pages_parent_fkey" FOREIGN KEY ("parent") REFERENCES "public"."pages"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."profiles"
ADD
  CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;

--
-- Name: sections sections_master_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_master_fkey" FOREIGN KEY ("master") REFERENCES "public"."sections"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sections sections_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sections sections_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_page_fkey" FOREIGN KEY ("page") REFERENCES "public"."pages"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sections sections_page_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_page_type_fkey" FOREIGN KEY ("page_type") REFERENCES "public"."page_types"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sections sections_palette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_palette_fkey" FOREIGN KEY ("palette") REFERENCES "public"."sections"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sections sections_symbol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sections"
ADD
  CONSTRAINT "sections_symbol_fkey" FOREIGN KEY ("symbol") REFERENCES "public"."symbols"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: site_groups site_groups_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."site_groups"
ADD
  CONSTRAINT "site_groups_owner_fkey" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sites sites_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sites"
ADD
  CONSTRAINT "sites_group_fkey" FOREIGN KEY ("group") REFERENCES "public"."site_groups"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: sites sites_owner_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."sites"
ADD
  CONSTRAINT "sites_owner_fkey1" FOREIGN KEY ("owner") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: symbols symbols_owner_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE
  ONLY "public"."symbols"
ADD
  CONSTRAINT "symbols_owner_site_fkey" FOREIGN KEY ("owner_site") REFERENCES "public"."sites"("id") ON UPDATE CASCADE ON DELETE CASCADE;

--
-- Name: collaborators Authenticated users can view; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Authenticated users can view" ON "public"."collaborators" FOR
SELECT
  USING (("auth"."uid"() IS NOT NULL));

--
-- Name: sites Collaborators can update; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators can update" ON "public"."sites" FOR
UPDATE
  USING (
    (
      "id" IN (
        SELECT
          "collaborators"."owner_site"
        FROM
          "public"."collaborators"
        WHERE
          ("collaborators"."user" = "auth"."uid"())
      )
    )
  );

--
-- Name: sites Collaborators can view; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators can view" ON "public"."sites" FOR
SELECT
  USING (
    (
      "id" IN (
        SELECT
          "collaborators"."owner_site"
        FROM
          "public"."collaborators"
        WHERE
          ("collaborators"."user" = "auth"."uid"())
      )
    )
  );

--
-- Name: entries Collaborators have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators have full access" ON "public"."entries" USING (
  (
    "owner_site" IN (
      SELECT
        "collaborators"."owner_site"
      FROM
        "public"."collaborators"
      WHERE
        ("collaborators"."user" = "auth"."uid"())
    )
  )
);

--
-- Name: fields Collaborators have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators have full access" ON "public"."fields" USING (
  (
    "owner_site" IN (
      SELECT
        "collaborators"."owner_site"
      FROM
        "public"."collaborators"
      WHERE
        ("collaborators"."user" = "auth"."uid"())
    )
  )
);

--
-- Name: page_types Collaborators have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators have full access" ON "public"."page_types" USING (
  (
    "owner_site" IN (
      SELECT
        "collaborators"."owner_site"
      FROM
        "public"."collaborators"
      WHERE
        ("collaborators"."user" = "auth"."uid"())
    )
  )
);

--
-- Name: pages Collaborators have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators have full access" ON "public"."pages" USING (
  (
    "owner_site" IN (
      SELECT
        "collaborators"."owner_site"
      FROM
        "public"."collaborators"
      WHERE
        ("collaborators"."user" = "auth"."uid"())
    )
  )
);

--
-- Name: sections Collaborators have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators have full access" ON "public"."sections" USING (
  (
    "owner_site" IN (
      SELECT
        "collaborators"."owner_site"
      FROM
        "public"."collaborators"
      WHERE
        ("collaborators"."user" = "auth"."uid"())
    )
  )
);

--
-- Name: symbols Collaborators have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Collaborators have full access" ON "public"."symbols" USING (
  (
    "owner_site" IN (
      SELECT
        "collaborators"."owner_site"
      FROM
        "public"."collaborators"
      WHERE
        ("collaborators"."user" = "auth"."uid"())
    )
  )
);

--
-- Name: entries Library Symbol owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Library Symbol owners have full access" ON "public"."entries" USING (
  (
    "library_symbol" IN (
      SELECT
        "library_symbols"."id"
      FROM
        "public"."library_symbols"
      WHERE
        ("library_symbols"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: fields Library Symbol owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Library Symbol owners have full access" ON "public"."fields" USING (
  (
    "library_symbol" IN (
      SELECT
        "library_symbols"."id"
      FROM
        "public"."library_symbols"
      WHERE
        ("library_symbols"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: profiles Owner has full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owner has full access" ON "public"."profiles" USING (("auth"."uid"() = "id"));

--
-- Name: library_settings Owners can insert; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners can insert" ON "public"."library_settings" FOR
INSERT
  WITH CHECK (("auth"."uid"() = "owner"));

--
-- Name: library_settings Owners can update; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners can update" ON "public"."library_settings" FOR
UPDATE
  USING (("auth"."uid"() = "owner")) WITH CHECK (("auth"."uid"() = "owner"));

--
-- Name: library_settings Owners can view; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners can view" ON "public"."library_settings" FOR
SELECT
  USING (("auth"."uid"() = "owner"));

--
-- Name: library_symbol_groups Owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners have full access" ON "public"."library_symbol_groups" USING (("auth"."uid"() = "owner")) WITH CHECK (("auth"."uid"() = "owner"));

--
-- Name: library_symbols Owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners have full access" ON "public"."library_symbols" USING (("auth"."uid"() = "owner")) WITH CHECK (("auth"."uid"() = "owner"));

--
-- Name: sections Owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners have full access" ON "public"."sections" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: site_groups Owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners have full access" ON "public"."site_groups" USING (("auth"."uid"() = "owner"));

--
-- Name: sites Owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners have full access" ON "public"."sites" USING (("owner" = "auth"."uid"()));

--
-- Name: symbols Owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Owners have full access" ON "public"."symbols" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: entries Site owner has full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owner has full access" ON "public"."entries" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: collaborators Site owners can delete collaborators; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners can delete collaborators" ON "public"."collaborators" FOR DELETE USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: collaborators Site owners can insert collaborators; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners can insert collaborators" ON "public"."collaborators" FOR
INSERT
  WITH CHECK (
    (
      "owner_site" IN (
        SELECT
          "sites"."id"
        FROM
          "public"."sites"
        WHERE
          ("sites"."owner" = "auth"."uid"())
      )
    )
  );

--
-- Name: collaborators Site owners can update collaborators; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners can update collaborators" ON "public"."collaborators" FOR
UPDATE
  USING (
    (
      "owner_site" IN (
        SELECT
          "sites"."id"
        FROM
          "public"."sites"
        WHERE
          ("sites"."owner" = "auth"."uid"())
      )
    )
  );

--
-- Name: fields Site owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners have full access" ON "public"."fields" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: invitations Site owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners have full access" ON "public"."invitations" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: page_types Site owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners have full access" ON "public"."page_types" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: pages Site owners have full access; Type: POLICY; Schema: public; Owner: postgres
--
CREATE POLICY "Site owners have full access" ON "public"."pages" USING (
  (
    "owner_site" IN (
      SELECT
        "sites"."id"
      FROM
        "public"."sites"
      WHERE
        ("sites"."owner" = "auth"."uid"())
    )
  )
);

--
-- Name: collaborators; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."collaborators" ENABLE ROW LEVEL SECURITY;

--
-- Name: entries; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."entries" ENABLE ROW LEVEL SECURITY;

--
-- Name: fields; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."fields" ENABLE ROW LEVEL SECURITY;

--
-- Name: invitations; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."invitations" ENABLE ROW LEVEL SECURITY;

--
-- Name: library_settings; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."library_settings" ENABLE ROW LEVEL SECURITY;

--
-- Name: library_symbol_groups; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."library_symbol_groups" ENABLE ROW LEVEL SECURITY;

--
-- Name: library_symbols; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."library_symbols" ENABLE ROW LEVEL SECURITY;

--
-- Name: page_types; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."page_types" ENABLE ROW LEVEL SECURITY;

--
-- Name: pages; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."pages" ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."profiles" ENABLE ROW LEVEL SECURITY;

--
-- Name: sections; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."sections" ENABLE ROW LEVEL SECURITY;

--
-- Name: site_groups; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."site_groups" ENABLE ROW LEVEL SECURITY;

--
-- Name: sites; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."sites" ENABLE ROW LEVEL SECURITY;

--
-- Name: symbols; Type: ROW SECURITY; Schema: public; Owner: postgres
--
ALTER TABLE
  "public"."symbols" ENABLE ROW LEVEL SECURITY;

--
-- Name: TABLE "collaborators"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."collaborators" TO "anon";

GRANT ALL ON TABLE "public"."collaborators" TO "authenticated";

GRANT ALL ON TABLE "public"."collaborators" TO "service_role";

--
-- Name: SEQUENCE "collaborators_id_seq"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON SEQUENCE "public"."collaborators_id_seq" TO "anon";

GRANT ALL ON SEQUENCE "public"."collaborators_id_seq" TO "authenticated";

GRANT ALL ON SEQUENCE "public"."collaborators_id_seq" TO "service_role";

--
-- Name: TABLE "entries"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."entries" TO "anon";

GRANT ALL ON TABLE "public"."entries" TO "authenticated";

GRANT ALL ON TABLE "public"."entries" TO "service_role";

--
-- Name: TABLE "fields"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."fields" TO "anon";

GRANT ALL ON TABLE "public"."fields" TO "authenticated";

GRANT ALL ON TABLE "public"."fields" TO "service_role";

--
-- Name: TABLE "invitations"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."invitations" TO "anon";

GRANT ALL ON TABLE "public"."invitations" TO "authenticated";

GRANT ALL ON TABLE "public"."invitations" TO "service_role";

--
-- Name: SEQUENCE "invitations_id_seq"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON SEQUENCE "public"."invitations_id_seq" TO "anon";

GRANT ALL ON SEQUENCE "public"."invitations_id_seq" TO "authenticated";

GRANT ALL ON SEQUENCE "public"."invitations_id_seq" TO "service_role";

--
-- Name: TABLE "library_settings"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."library_settings" TO "anon";

GRANT ALL ON TABLE "public"."library_settings" TO "authenticated";

GRANT ALL ON TABLE "public"."library_settings" TO "service_role";

--
-- Name: TABLE "library_symbol_groups"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."library_symbol_groups" TO "anon";

GRANT ALL ON TABLE "public"."library_symbol_groups" TO "authenticated";

GRANT ALL ON TABLE "public"."library_symbol_groups" TO "service_role";

--
-- Name: SEQUENCE "library_symbol_groups_id_seq"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON SEQUENCE "public"."library_symbol_groups_id_seq" TO "anon";

GRANT ALL ON SEQUENCE "public"."library_symbol_groups_id_seq" TO "authenticated";

GRANT ALL ON SEQUENCE "public"."library_symbol_groups_id_seq" TO "service_role";

--
-- Name: TABLE "library_symbols"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."library_symbols" TO "anon";

GRANT ALL ON TABLE "public"."library_symbols" TO "authenticated";

GRANT ALL ON TABLE "public"."library_symbols" TO "service_role";

--
-- Name: TABLE "page_types"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."page_types" TO "anon";

GRANT ALL ON TABLE "public"."page_types" TO "authenticated";

GRANT ALL ON TABLE "public"."page_types" TO "service_role";

--
-- Name: TABLE "pages"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."pages" TO "anon";

GRANT ALL ON TABLE "public"."pages" TO "authenticated";

GRANT ALL ON TABLE "public"."pages" TO "service_role";

--
-- Name: TABLE "profiles"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."profiles" TO "anon";

GRANT ALL ON TABLE "public"."profiles" TO "authenticated";

GRANT ALL ON TABLE "public"."profiles" TO "service_role";

--
-- Name: TABLE "sections"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."sections" TO "anon";

GRANT ALL ON TABLE "public"."sections" TO "authenticated";

GRANT ALL ON TABLE "public"."sections" TO "service_role";

--
-- Name: TABLE "site_groups"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."site_groups" TO "anon";

GRANT ALL ON TABLE "public"."site_groups" TO "authenticated";

GRANT ALL ON TABLE "public"."site_groups" TO "service_role";

--
-- Name: SEQUENCE "site_groups_id_seq"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON SEQUENCE "public"."site_groups_id_seq" TO "anon";

GRANT ALL ON SEQUENCE "public"."site_groups_id_seq" TO "authenticated";

GRANT ALL ON SEQUENCE "public"."site_groups_id_seq" TO "service_role";

--
-- Name: TABLE "sites"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."sites" TO "anon";

GRANT ALL ON TABLE "public"."sites" TO "authenticated";

GRANT ALL ON TABLE "public"."sites" TO "service_role";

--
-- Name: TABLE "symbols"; Type: ACL; Schema: public; Owner: postgres
--
GRANT ALL ON TABLE "public"."symbols" TO "anon";

GRANT ALL ON TABLE "public"."symbols" TO "authenticated";

GRANT ALL ON TABLE "public"."symbols" TO "service_role";

-- Create buckets
INSERT INTO
  storage.buckets (id, name, public)
VALUES
  ('sites', 'sites', true),
  ('symbols', 'symbols', true);

-- Create policies for authenticated users to access the 'sites' bucket
CREATE POLICY "Allow authenticated access to sites bucket" ON storage.objects FOR ALL TO authenticated USING (
  (bucket_id = 'sites' :: text)
  AND (auth.role() = 'authenticated' :: text)
);

-- Create policies for authenticated users to access the 'symbols' bucket
CREATE POLICY "Allow authenticated access to symbols bucket" ON storage.objects FOR ALL TO authenticated USING (
  (bucket_id = 'symbols' :: text)
  AND (auth.role() = 'authenticated' :: text)
);