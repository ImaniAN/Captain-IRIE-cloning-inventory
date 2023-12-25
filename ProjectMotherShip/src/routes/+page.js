import { supabase } from "$lib/supabaseClient";

export async function load() {
  const { data } = await supabase.from("geneticmarker").select();
  return {
    geneticmarker: data ?? [],
  };
}