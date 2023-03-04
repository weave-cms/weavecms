import { createClient } from '@supabase/auth-helpers-sveltekit'

// Create a single supabase client for interacting with your database, auth, and storage
export default createClient(import.meta.env.VITE_SUPABASE_URL, import.meta.env.VITE_SUPABASE_PUBLIC_KEY)