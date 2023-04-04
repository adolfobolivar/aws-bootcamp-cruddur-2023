-- this file was manually created
INSERT INTO public.users (display_name, handle, email, cognito_user_id)
VALUES
  ('adolfo bolivar', 'isos83' , 'isos83@hotmail.com', 'MOCK');
  ('mariu bolivar', 'mariu028' , 'mariu028@gmail.com', 'MOCK');
  ('Londo Mollari', 'londo' , 'lmollari@centari.com',  'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'isos83' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )