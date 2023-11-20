import 'package:reactive_forms/reactive_forms.dart';

class RegistrationForms {
  static final FormGroup RegistrationForm = FormGroup({
    'shop_name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'shop_city': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'partner_type': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'owner_name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'owner_email': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'mobile_no': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'shop_full_adress': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'shop_contact': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'shop_opening': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'shop_closing': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });
}
